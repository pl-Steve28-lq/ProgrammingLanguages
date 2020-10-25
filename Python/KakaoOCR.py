import requests

def ocr(path):
  url = "https://dapi.kakao.com/v2/vision/text/ocr"
  
  headers = {
    "Authorization" : "KakaoAK 330ff6c8999f169eea46b7fab00be07a",
    "Accept-Charset" : "UTF-8",
    "Host" : "dapi.kakao.com"
  }
  
  files = {
    "image" : (
      path.split("/")[-1],
      open(path, 'rb')
    )
  }

  return requests.post(url, headers = headers, files = files).json()
