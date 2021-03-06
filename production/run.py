#! /usr/bin/env python3

import frida
import sys
import os
import time
from termcolor import cprint
import argparse

from mobsf import MobSF
from generate_report import gen_report

DELAY_TIME = 0.5
WAIT_TIME = 0.8
FINAL_WAIT_TIME = 3

DEBUG = True


def open_activity(activity_name, activity_fullname, package_name):
    print("[*] {}: Starting activity...".format(activity_name))
    os.system("adb shell pm clear {} > /dev/null".format(package_name))
    time.sleep(DELAY_TIME)
    os.system("adb shell am start -n {}/{} > /dev/null".format(package_name, activity_fullname))
    print("[*] {}: Activity started".format(activity_name))
    time.sleep(DELAY_TIME)

def reopen_page(activity_name, activity_fullname, package_name):
    os.system("adb shell input keyevent KEYCODE_BACK")
    # time.sleep(DELAY_TIME)
    os.system("adb shell am start -n {}/{} > /dev/null".format(package_name, activity_fullname))



def find_buttons(activity_name, activity_fullname, package_name):
    """
    Return a set of Buttons
    """
    open_activity(activity_name, activity_fullname, package_name)
    
    print("[*] {}: Finding buttons".format(activity_name))

    print("[*] {}: Adding search hooks...".format(activity_name))
    jscode = open("find_buttons.js").read()

    buttons = set()
    def on_message(message, data):
        if message["type"] == "error":
            if DEBUG:
                cprint("[!] Error in JS Code:", "yellow")
                cprint("[!] > " + message["description"], "yellow")
        elif "app:id" in message["payload"]:
            nonlocal buttons
            buttons.add(int(message["payload"].split("#")[1].split(" ")[0], base=16))
            # print(int(message["payload"].split("#")[1].split(" ")[0], base=16))

    
    session = frida.get_usb_device().attach(package_name)
    script = session.create_script(jscode)
    script.on('message', on_message)
    script.load()

    print("[*] {}: Search hooks added, reloading activity...".format(activity_name))
    reopen_page(activity_name, activity_fullname, package_name)
    time.sleep(WAIT_TIME)
    print("[*] {}: Found {} buttons".format(activity_name, len(buttons)))
    script.unload()
    return buttons


def click_button(activity_name, activity_fullname, button_id, package_name):
    """
    Click button, also insert text to EditTexts
    """
    print("[*] {}: Testing button {}".format(activity_name, button_id))

    jscode = open("click_button.js").read()
    jscode = jscode.replace("[BUTTONID]", str(button_id))\
                   .replace("[APPNAME]", package_name)\
                   .replace("[ACTIVITY]", activity_fullname)\
                   .replace("[ACTIVITYSHORT]", activity_name)
    
    open("tmp.js", "w").write(jscode)

    def on_message(message, data):
        if message["type"] == "error":
            if DEBUG:
                cprint("[!] Error in JS Code:", "yellow")
                cprint("[!] > " + message["description"], "yellow")

    session = frida.get_usb_device().attach(package_name)

    script = session.create_script(jscode)
    script.on('message', on_message)
    script.load()

    print("[*] {}: Hooks added, reloading activity...".format(activity_name))
    reopen_page(activity_name, activity_fullname, package_name)
    time.sleep(FINAL_WAIT_TIME)
    script.unload()


def generate_sec_js(sec_fun):
    lines = open(sec_fun).read().splitlines()
    output = []
    output.append("""
Java.perform(function() {
    var sendWarn = function(disc, code, cvss){
        send("[ACTIVITYSHORT]#|#" + disc + "#|#" + code + "#|#" + cvss);
    }

""")

    classes = {}
    curClass = ""
    uniqueSet = set()
    overloadSet = set()
    for l in lines:
        if len(l.strip()) == 0:
            continue

        items = l.split("|")
        if items[0] == "CLASS":
            curClass = items[1]
            classes[curClass] = []
            uniqueSet.clear()
        else:
            fun_name = items[0].split('(')[0]
            fun_args = items[0].split('(')[1].split(')')[0]
            args_cnt = len(fun_args.split(',')) if len(fun_args) > 1 else 0
            if fun_name in uniqueSet:
                overloadSet.add(fun_name)
            else:
                uniqueSet.add(fun_name)
            classes[curClass].append((fun_name, fun_args, args_cnt, items[1], items[2]))

    gen_fun_args = lambda n: ", ".join(list(map(lambda x: chr(x+ord('a')), range(n))))
    gen_real_fun_args = lambda n: "' + " + " + ', ' + ".join(list(map(lambda x: chr(x+ord('a')), range(n)))) + " + '" if n > 0 else "' + '"
    
    for class_name , class_methods in classes.items():
        output.append("    var {} = Java.use('{}');".format(class_name.replace(".", "_"), class_name))
        for fun_name, fun_args, args_cnt, desc1, cvss in class_methods:
            if fun_name in overloadSet:
                output.append("    {}.{}.overload({}).implementation = function({}) {{".format(class_name.replace(".", "_"), fun_name, fun_args, gen_fun_args(args_cnt)))
            else:
                output.append("    {}.{}.implementation = function({}) {{".format(class_name.replace(".", "_"), fun_name, gen_fun_args(args_cnt)))
            
            output.append("        sendWarn('{}', '{}.{}({})', '{}');".format(desc1, class_name.split(".")[-1], fun_name, gen_real_fun_args(args_cnt), cvss))
            

            output.append("        return this.{}({});".format(fun_name, gen_fun_args(args_cnt)))
            output.append("    }")
        output.append("")
    output.append("[CUSTOMHOOKS]")
    output.append("})")
    jscode = "\n".join(output) + "\n"
    open("security_hooks.js", "w").write(jscode)
        

def load_sec_hook(activity_name, issues):
    """
    Add security hook
    """
    print("[*] {}: Adding security testing hooks...".format(activity_name))

    jscode = open("security_hooks.js").read()
    jscode = jscode.replace("[CUSTOMHOOKS]", open("custom.js").read()).replace("[ACTIVITYSHORT]", activity_name)
    
    if DEBUG:
        open("tmp-sec.js", "w").write(jscode)

    def on_message(message, data):
        nonlocal issues
        if message["type"] == "error":
            if DEBUG:
                cprint("[!] Error in JS Code:", "yellow")
                cprint("[!] > " + message["description"], "yellow")
        else:
            activity, disc, code, cvss = message["payload"].split("#|#")
            cprint("[!] {}: -----".format(activity), 'red', end="")
            cprint(" ⚠️ Found security issue ⚠️ ", 'yellow', attrs=['blink'], end="")
            cprint("-----", 'red')
            cprint("[!] {}: ".format(activity), 'red', end="")
            cprint(disc, 'yellow')
            cprint("[!] {}: ".format(activity), 'red', end="")
            cprint("> {}".format(code), 'yellow')
            cprint("[!] {}: ------------------------------------".format(activity), 'red')
            issues.add((activity, disc, code, cvss))

    session = frida.get_usb_device().attach(package_name)

    script = session.create_script(jscode)
    script.on('message', on_message)
    script.load()

    print("[*] {}: Security testing hooks added".format(activity_name))


def install_app(file, package_name):
    print("[*] Phone: Checking if app {} is installed...".format(package_name))
    if os.system("adb shell pm list packages | grep {} > /dev/null".format(package_name)) != 0:
        print("[*] Phone: App not installed, installing...")
        os.system("adb install '{}' > /dev/null".format(file))
        print("[*] Phone: App installed!")
    else:
        print("[*] Phone: App is already installed")



def mobsf_scan(host, port, apk, https):
    mobsf = MobSF(host, port, https)
    apk_file = mobsf.upload(apk)
    report = mobsf.scan(apk_file)

    activity_names = report["activities"]
    def getClass(file_path):
        result = set()
        class_fullname = ".".join(file_path[:-5].split("/"))
        if class_fullname in activity_names:
            result.add(class_fullname)
        return result

    vuln_activities = set()

    code_analysis = report['code_analysis']
    for issue_type in code_analysis.keys():
        files = code_analysis[issue_type]['files']
        for file_path in files.keys():
            vuln_activities = vuln_activities.union(getClass(file_path))
    print("[*] MobSF: Found {} activities with potential security issues".format(len(vuln_activities)))
    return vuln_activities, report["app_name"], report["package_name"]

logo = """
██╗ █████╗  █████╗ ███████╗████████╗
██║██╔══██╗██╔══██╗██╔════╝╚══██╔══╝
██║███████║███████║███████╗   ██║   
██║██╔══██║██╔══██║╚════██║   ██║   
██║██║  ██║██║  ██║███████║   ██║   
╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝   ╚═╝   
"""

if __name__ == "__main__":
    print(logo)
    parser = argparse.ArgumentParser()
    parser.add_argument("host", help="MobSF IP/Hostname")
    parser.add_argument("-p", "--port", help="MobSF Port", default="8000")
    parser.add_argument("apk", help="APK file path")
    parser.add_argument("--https", help="Connect to MobSF using HTTPS", action="store_true")

    args = parser.parse_args()

    vuln_activities, app_name, package_name = mobsf_scan(args.host, args.port, args.apk, args.https)
    install_app(args.apk, package_name)
    generate_sec_js("vuln_functions")
    issues = set()

    for activity_fullname in vuln_activities:
        try:
            activity_name = activity_fullname.split(".")[-1]
            print("[*] {}: Running test on activity: {}".format(activity_name, activity_name))

            buttons = find_buttons(activity_name, activity_fullname, package_name)

            load_sec_hook(activity_name, issues)
            
            for button in buttons:
                click_button(activity_name, activity_fullname, button, package_name)
        except Exception as e:
            if DEBUG:
                print(e)
            print("[*] {}: Activity closed, continuing..".format(activity_name))
    
    gen_report(app_name, issues)
    print("\nThanks for using ..\n" + logo)
    input("Press Enter to exit...\n")
    # sys.stdin.read()

