#! /usr/bin/env python3

import frida
import sys
import os
import time
from termcolor import cprint
import argparse

from mobsf import MobSF
import javalang

DELAY_TIME = 0.5
WAIT_TIME = 0.8
FINAL_WAIT_TIME = 2


def open_activity(activity_name):
    print("[*] {}: Starting activity...".format(activity_name))
    os.system("adb shell pm clear {} > /dev/null".format(app_name))
    time.sleep(DELAY_TIME)
    os.system("adb shell am start -n {}/{}.{} > /dev/null".format(app_name, app_name, activity_name))
    print("[*] {}: Activity started".format(activity_name))
    time.sleep(DELAY_TIME)

def reopen_page(activity_name):
    os.system("adb shell input keyevent KEYCODE_BACK")
    time.sleep(DELAY_TIME)
    os.system("adb shell am start -n {}/{}.{} > /dev/null".format(app_name, app_name, activity_name))



def find_buttons(activity_name, app_name):
    """
    Return a set of Buttons,]
    """

    open_activity(activity_name)
    
    print("[*] {}: Finding buttons".format(vuln_act))

    print("[*] {}: Adding search hooks...".format(activity_name))
    jscode = open("find_buttons.js").read()

    buttons = set()
    def on_message(message, data):
        if message["type"] == "error":
            cprint("[!] Error in JS Code:", "yellow")
            cprint("[!] > " + message["description"], "yellow")
        elif "app:id" in message["payload"]:
            nonlocal buttons
            buttons.add(int(message["payload"].split("#")[1].split(" ")[0], base=16))
            # print(int(message["payload"].split("#")[1].split(" ")[0], base=16))

    
    session = frida.get_usb_device().attach(app_name)
    script = session.create_script(jscode)
    script.on('message', on_message)
    script.load()

    print("[*] {}: Search hooks added, reloading activity...".format(activity_name))
    reopen_page(activity_name)
    time.sleep(WAIT_TIME)
    print("[*] {}: Found {} buttons".format(activity_name, len(buttons)))
    script.unload()
    return buttons


def click_button(activity_name, button_id, app_name):
    """
    Click button, also insert text to EditTexts, and other security checks
    """
    print("[*] {}: Testing button {}".format(activity_name, button_id))
    print("[*] {}: Adding security testing hooks...".format(activity_name))

    jscode = open("click_button.js").read()
    jscode = jscode.replace("[BUTTONID]", str(button_id))\
                   .replace("[APPNAME]", app_name)\
                   .replace("[ACTIVITY]", activity_name)

    def on_message(message, data):
        if message["type"] == "error":
            cprint("[!] Error in JS Code:", "yellow")
            cprint("[!] > " + message["description"], "yellow")
        else:
            msg = message["payload"].split("#")[1]
            if "⚠️" in msg:
                cprint(msg.split("⚠️")[0], 'red', end="")
                cprint("⚠️" + msg.split("⚠️")[1] + "⚠️", 'yellow', attrs=['blink'], end="")
                cprint(msg.split("⚠️")[2], 'red')
            elif "----------------------------------" in msg:
                cprint(msg, 'red')
            else:
                cprint(msg.split(": ")[0] + ": ", 'red', end="")
                cprint(": ".join(msg.split(": ")[1:]), 'yellow')

    session = frida.get_usb_device().attach(app_name)

    script = session.create_script(jscode)
    script.on('message', on_message)
    script.load()

    print("[*] {}: Security testing hooks added, reloading activity...".format(activity_name))
    reopen_page(activity_name)
    time.sleep(FINAL_WAIT_TIME)
    # script.unload()


# def generate_sec_js(file):
#     lines = open("vuln_functions").read().splitlines()
#     output = []

#     classes = []
#     curClass = ""
#     uniqueSet = set()
#     for l in lines:
#         if len(l.strip()) == 0:
#             continue

#         items = l.split("|")
#         if items[0] == "CLASS":
#             curClass = items[1]
#             classes[curClass] = []
#             uniqueSet.clear()
#         else:
#             fun_name = items[0].split('(')[0]
#             fun_args = items[0].split('(')[1].split([')'][0])
#             args_cnt = len(fun_args.split(','))
#             if fun_name in uniqueSet:
#                 overload = True
#             else:
#                 uniqueSet.add()
#             classes[curClass].append(
        
#             res.append("    var {} = Java.use('{}');".format(curClass, items[1]))

#         res.append("    {}.{}.implementation = function({}) {".append())
        

        

def install_app(file, app_name):
    print("[*] Phone: Checking if app {} is installed...".format(app_name))
    if os.system("adb shell pm list packages | grep {} > /dev/null".format(app_name)) != 0:
        print("[*] Phone: App not installed, installing...")
        os.system("adb install {} > /dev/null".format(file))
        print("[*] Phone: App installed!")
    else:
        print("[*] Phone: App is already installed")



def mobsf_scan(host, port, apk, https):
    mobsf = MobSF(host, port, https)
    apk_file = mobsf.upload(apk)
    report = mobsf.scan(apk_file)

    activity_names = report["activities"]
    def isActivity(class_name, file_path):
        class_fullname = ".".join(file_path.split("/")[:-1]) + "." + class_name
        if class_fullname in activity_names:
            return True
        else:
            return False


    def getClass(tree, target_lines, file_path):
        result = set()
        for line in map(int, target_lines.split(',')):
            prev_class = None
            for path, node in tree.filter(javalang.tree.ClassDeclaration):
                if node.position.line > line:
                    break
                prev_class = node
            if prev_class is not None and isActivity(prev_class.name, file_path):
                result.add(prev_class.name)
        return result

    vuln_activities = set()

    code_analysis = report['code_analysis']
    for issue_type in code_analysis.keys():
        files = code_analysis[issue_type]['files']
        for file_path in files.keys():
            src = mobsf.viewSource(apk_file['hash'], file_path)['dat']
            tree = javalang.parse.parse(src)
            target_lines = files[file_path]
            # print("class: {}".format(getClass(tree, target_lines)))
            vuln_activities = vuln_activities.union(getClass(tree, target_lines, file_path))
    print("[*] MobSF: Found {} activities with potential security issues".format(len(vuln_activities)))
    return vuln_activities, report["package_name"]


if __name__ == "__main__":

    parser = argparse.ArgumentParser()
    parser.add_argument("host", help="MobSF IP/Hostname")
    parser.add_argument("-p", "--port", help="MobSF Port", default="8000")
    parser.add_argument("apk", help="APK file path")
    parser.add_argument("--https", help="Connect to MobSF using HTTPS", action="store_true")

    args = parser.parse_args()

    # vuln_activities = ["AccessControl2Activity"]
    vuln_activities, app_name = mobsf_scan(args.host, args.port, args.apk, args.https)
    install_app(args.apk, app_name)

    for vuln_act in vuln_activities:
        print("[*] {}: Running test on activity: {}".format(vuln_act, vuln_act))

        buttons = find_buttons(vuln_act, app_name)
        
        for button in buttons:
            click_button(vuln_act, button, app_name)
    
    sys.stdin.read()






# openapp()
# 

# jscode = open("diva.js").read()

# 

# script = process.create_script(jscode)
# def on_message(message, data):
#     if("app:id" in message["payload"]):
#         print(message["payload"].split("app:id/")[1][:-1])
# script.on('message', on_message)
# print('[*] Running')
# script.load()
# os.system("adb shell am start --activity-single-top %s/%s.MainActivity"%(app_name,app_name))
# sys.stdin.read()
