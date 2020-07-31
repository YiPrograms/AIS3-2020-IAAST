import frida
import sys
import os
import time
from termcolor import cprint

DELAY_TIME = 1
WAIT_TIME = 2

app_name = "jakhar.aseem.diva"
# app_name = sys.argv[1]

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



def find_buttons(activity_name):
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
    return buttons


def click_button(activity_name, button_id):
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
                cprint(msg.split(": ")[1], 'yellow')

    session = frida.get_usb_device().attach(app_name)

    script = session.create_script(jscode)
    script.on('message', on_message)
    script.load()

    print("[*] {}: Security testing hooks added, reloading activity...".format(activity_name))
    reopen_page(activity_name)
    time.sleep(WAIT_TIME*2)


def generate_sec_js(file):
    pass


if __name__ == "__main__":
    vuln_activities = ["LogActivity", "InsecureDataStorage4Activity", "SQLInjectionActivity"]
    for vuln_act in vuln_activities:
        print("[*] {}: Running test on activity: {}".format(vuln_act, vuln_act))

        buttons = find_buttons(vuln_act)
        
        for button in buttons:
            click_button(vuln_act, button)





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
