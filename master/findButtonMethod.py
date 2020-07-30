import xml.etree.ElementTree as ET
import sys
import os

apk_path = sys.argv[1]
apk_name = os.path.basename(apk_path)[:-4]

if not os.path.isdir(apk_name):
    os.system("apktool d {}".format(apk_path))

# root = ET.parse('thefile.xml').getroot()