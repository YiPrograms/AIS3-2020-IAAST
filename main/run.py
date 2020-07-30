import frida
import sys
import os
import time

DELAY_TIME = 1
WAIT_TIME = 2

app_name = "jakhar.aseem.diva"
# app_name = sys.argv[1]

def open_activity(activity_name):
    print("[*] {}: Starting activity".format(activity_name))
    os.system("adb shell pm clear {}".format(app_name))
    time.sleep(DELAY_TIME)
    os.system("adb shell am start -n {}/{}.{}".format(app_name, app_name, activity_name))
    time.sleep(DELAY_TIME)

def reopen_page(activity_name):
    os.system("adb shell input keyevent KEYCODE_BACK")
    time.sleep(DELAY_TIME)
    os.system("adb shell am start -n {}/{}.{}".format(app_name, app_name, activity_name))

def find_buttons(activity_name):
    """
    Return a set of Buttons,]
    """

    open_activity(activity_name)
    print("[*] {}: Finding buttons".format(vuln_act))

    print("[*] {}: Adding hooks".format(activity_name))
    jscode = open("find_buttons.js").read()

    buttons = set()
    def on_message(message, data):
        if message["type"] == "error":
            print("[!] Error in JS Code:")
            print(message["description"])
        elif "app:id" in message["payload"]:
            nonlocal buttons
            buttons.add(int(message["payload"].split("#")[1].split(" ")[0], base=16))
            # print(int(message["payload"].split("#")[1].split(" ")[0], base=16))

    
    session = frida.get_usb_device().attach(app_name)
    script = session.create_script(jscode)
    script.on('message', on_message)
    script.load()

    print("[*] {}: Hooks added, reloading".format(activity_name))
    reopen_page(activity_name)
    time.sleep(WAIT_TIME)
    return buttons


def click_button(activity_name, button_id):
    """
    Click button, also insert text to EditTexts
    """

    jscode = open("click_button.js").read()
    jscode = jscode.replace("[BUTTONID]", str(button_id))\
                   .replace("[APPNAME]", app_name)\
                   .replace("[ACTIVITY]", activity_name)

    def on_message(message, data):
        if message["type"] == "error":
            print("[!] Error in JS Code:")
            print(message["description"])

    session = frida.get_usb_device().attach(app_name)
    script = session.create_script(jscode)
    script.on('message', on_message)
    script.load()

    print("[*] {}: Hooks added, reloading".format(activity_name))
    reopen_page(activity_name)
    time.sleep(WAIT_TIME)



if __name__ == "__main__":
    vuln_activities = ["HardcodeActivity"]
    for vuln_act in vuln_activities:
        print("[*] Running test on activity: {}".format(vuln_act))

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
