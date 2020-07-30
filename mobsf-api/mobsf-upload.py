from credentials import *
import requests
from requests_toolbelt.multipart.encoder import MultipartEncoder
import os

def uploadAPK(filepath):
    multipart_data = MultipartEncoder(fields={'file': (filepath, open(filepath, 'rb'), 'application/octet-stream')})
    headers = {'Content-Type': multipart_data.content_type, 'Authorization': APIKEY}
    response = requests.post(SERVER + '/api/v1/upload', data=multipart_data, headers=headers)
    print(response.text)
    return response.text


if __name__ == "__main__":
    import sys
    uploadAPK(sys.argv[1])