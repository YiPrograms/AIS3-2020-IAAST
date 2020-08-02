# IAAST

## requirement
+ [MobSF](https://github.com/MobSF/Mobile-Security-Framework-MobSF)
    + We recommand to use docker
+ python3
+ [Frida](https://frida.re/docs/installation/)
    + In here, you need to install firda on python first, and send the [frida server file](https://github.com/frida/frida/releases) to your android device.
    + NOTE: your frida python version need to same as your frida server version on Android devices
+ [termcolor](https://pypi.org/project/termcolor/)

## Usage
+ Connect your android device with root privilege
    + ```adb root```
+ Run your frida server on Android device
+ ```cd production```
+ ./run.py -p [mobsf port] [mobsf ip] [apk file]
    + example: ```./run.py -p 8000 127.0.0.1 ../diva.apk```

Run.py will auto upload your apk file to MOBSF and install the apk to your device if you are not installed. Then auto Run.
If you want to write your frida javascript, you can modify the custom.js. Or if you want to add other hook function you can modify "vuln_functions", we will automatic generate Hook function.

