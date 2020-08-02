# IAAST

IAAST (Interactive Android Application Security Testing) is an Android App testing suite that combines Static Analysis and Dynamic Analysis

IAAST parses MobSF static analysis' output and run the results on a real device. Insecure functions are hooked with Frida to detect insecure function calls

## Requirements
+ [MobSF](https://github.com/MobSF/Mobile-Security-Framework-MobSF)
    + We recommand to use docker
+ Python 3
    + Install requirements with `$ pip install -r requirements.txt`
+ [Frida](https://frida.re/docs/installation/)
    + Install `firda` and `firda-tools` on the host, and install frida-server on your rooted Android device with [this guide] (https://frida.re/docs/android/#setting-up-your-android-device).
    + NOTE: your frida python version need to same as your frida server version on Android devices


## Usage
1. Run frida server on your Android device
2. Connect to your Android device with root privilege

```
$ sudo adb start-server
$ adb devices  # You may have to click Allow on the phone
$ adb root  # Run adbd with root privileges
$ frida-ps -U  # Check if frida is working
```

3. ```$ cd production```
4. `./run.py -p [mobsf port] [mobsf ip] [apk file]`
    + example: ```./run.py -p 8000 127.0.0.1 ../diva-beta.apk```

IAAST will upload your apk file to MOBSF to analyze and install the apk on your device if it is not installed, and then the test will start automatically.
When the test is finished, a report will be generated as a HTML file


## Customization
If you want to add custom security functions, you can modify the custom.js. Or if you want to add other hook function you can modify "vuln_functions", we will generate Hook functions automatically.

## License

This program is released under [MIT License](https://github.com/YiPrograms/AIS3-2020-IAAST/blob/master/LICENSE)
