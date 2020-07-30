import frida
import sys



def on_message(message, data):
    print(message, data)


if len(sys.argv) != 3:
    print("Usage: {} [Process] [JS File]".format(sys.argv[0]))

session = frida.attach(sys.argv[1])
jscode = open(sys.argv[2]).read()
script = session.create_script(jscode)
script.on('message', on_message)
script.load()
print("[*] Finished script loading")
sys.stdin.read()