import requests
from bs4 import BeautifulSoup
import json

class MobSF():
    def __init__(self, host, port, https):
        self.url = 'http{}://{}:{}'.format("s" if https else "",host, port)
        print("[*] MobSF: URL: {}".format(self.url))
        print("[*] MobSF: Connecting to MobSF API...")
        # get api key
        req = requests.get(self.url + '/api_docs')
        html_doc = req.text
        soup = BeautifulSoup(html_doc, 'html.parser')
        self.api_key = soup.findAll('p', {'class': 'lead'})[0].strong.code.get_text()
        print("[*] MobSF: API Key: {}".format(self.api_key))
        
    def upload(self, fname):
        headers = {
            'Authorization' : self.api_key
        }
        files = {
            'file' : (fname, open(fname, 'rb'), 'application/octet-stream')
        }
        print("[*] MobSF: Uploading file: {} ...".format(fname))
        req = requests.post(self.url + '/api/v1/upload', headers=headers, files=files)
        print("[*] MobSF: Uploaded!")
        # print(req.text)
        return json.loads(req.text)

    def scan(self, file, re_scan=0):
        print("[*] MobSF: Scanning file: {} ...".format(file["file_name"]))
        headers = {
            'Authorization' : self.api_key
        }
        data = {
            'scan_type' : file['scan_type'],
            'file_name' : file['file_name'],
            'hash' : file['hash'],
            're_scan' : re_scan,
        }
        req = requests.post(self.url + '/api/v1/scan', headers=headers, data=data)
        print("[*] MobSF: Finished scanning!")
        scan_url = "{}/StaticAnalyzer/?name={}&type={}&checksum={}".format(self.url, file["file_name"], file["scan_type"], file["hash"])
        print("[*] MobSF: Result: {}#code_analysis".format(scan_url))
        return json.loads(req.text)
    
