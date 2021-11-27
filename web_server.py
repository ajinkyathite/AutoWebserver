from flask import Flask
import requests
import logging


app = Flask(__name__)
@app.route("/")
def index():
   response = requests.get("https://6god8pgyzf.execute-api.us-west-2.amazonaws.com/databases")
   response_json = response.json()
   response_headers = response.headers
   status_code = response.status_code
   print(status_code)
   print(response_json)
   logging.basicConfig(filename='datafile.log',filemode='a',format='%(asctime)s,%(msecs)d %(name)s %(levelname)s %(message)s',datefmt='%H:%M:%S',level=logging.DEBUG)
   logging.info(str(status_code))
   logging.info(str(response_headers))
   logger = logging.getLogger()
   
   return str(status_code)
if __name__ == "__main__":
   app.run(host='0.0.0.0', port=80, debug=True)