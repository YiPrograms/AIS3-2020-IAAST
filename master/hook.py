import frida
import sys
import os
import time

app_name = "jakhar.aseem.diva"

def openapp():
    os.system("adb shell pm clear "+app_name)
    os.system("adb shell am start -n %s/%s.MainActivity"%(app_name,app_name))
    time.sleep(1)

openapp()
os.system("adb shell input keyevent KEYCODE_BACK")

jscode = open("diva.js").read()

process = frida.get_usb_device().attach(app_name)

script = process.create_script(jscode)
def on_message(message, data):
    if("app:id" in message["payload"]):
        print(message["payload"].split("app:id/")[1][:-1])
script.on('message', on_message)
print('[*] Running')
script.load()
os.system("adb shell am start --activity-single-top %s/%s.MainActivity"%(app_name,app_name))
sys.stdin.read()