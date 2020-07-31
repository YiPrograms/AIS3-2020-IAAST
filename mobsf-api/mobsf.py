import requests
from bs4 import BeautifulSoup
import json

class MOBSF():
    def __init__(self, host, port):
        self.url = 'http://{}:{}'.format(host, port)
        # get api key
        req = requests.get(self.url + '/api_docs')
        html_doc = req.text
        soup = BeautifulSoup(html_doc, 'html.parser')
        self.api_key = soup.findAll('p', {'class': 'lead'})[0].strong.code.get_text()
        print("API Key: {}".format(self.api_key))
        
    def upload(self, fname):
        headers = {
            'Authorization' : self.api_key
        }
        files = {
            'file' : (fname, open(fname, 'rb'), 'application/octet-stream')
        }
        print("upload file")
        req = requests.post(self.url + '/api/v1/upload', headers=headers, files=files)
        print("success!")
        print(req.text)
        return json.loads(req.text)

    def scan(self, file, re_scan=0):
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
        return json.loads(req.text)

    def viewSource(self, hash, file, type=None):
        if type == None:
            type = 'apk'
        headers = {
            'Authorization' : self.api_key
        }
        data = {
            'hash' : hash,
            'file' : file,
            'type' : type
        }
        req = requests.post(self.url + '/api/v1/view_source', headers=headers, data=data)
        return json.loads(req.text)
