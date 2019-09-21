from flask import Flask, send_file, request
from time import *
import os

app = Flask(__name__)

@app.route("/")
def hello():
    return "Hello Everyone! I'm a python script running on Pi and returning images from webcams"


@app.route("/get_image")
def get_image():
    if request.args.get('webcam') == '1':
        filename = "'/home/pi/testoutput/Webcam0_{0}.jpg'".format(getTimeStamp())
        string  = "uvccapture -m -d'/dev/video0' -o" + filename
        try:
            #Webcam video0
            print "Video0"
            
            res  = os.system(string)
            #sleep(1)
            #res  = os.system(string)
            if res==0:
                print "Video0 capture success!"
                filename = filename[1:-1]
            else:
                print "Video0 capture failure!"
                filename = "/home/pi/photo.jpg"
            
        except:
            filename = "/home/pi/photo.jpg"
            print "Video0 capture failure!"
    else:
        filename = "'/home/pi/testoutput/Webcam1_{0}.jpg'".format(getTimeStamp())
        string  = "uvccapture -m -d'/dev/video1' -o" + filename
        try:
            #Webcam video1
            print "Video1"
            
            res  = os.system(string)
            #sleep(1)
            #res  = os.system(string)
            if res==0:
                print "Video1 capture success!"
                filename = filename[1:-1]
            else:
                print "Video1 capture failure!"
                filename = "/home/pi/photo.jpg"
            
        except:
            filename = "/home/pi/photo.jpg"
            print "Video1 capture failure!"
            
    return send_file(filename, mimetype='image/jpeg')
    
    
    
def getTimeStamp():
    return strftime("%d-%m-%Y") + "__" + strftime("%H:%M:%S")

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=8080, debug=True)
