import subprocess 
import socket
import urllib.request
import time
import os 
#print(os.environ['name'])

ip = urllib.request.urlopen('https://ident.me').read().decode('utf8')

try:
    print("Hey im running your image on docker")
    rundocker = "docker run --rm -d -p 5000:5000 " + os.environ['name']  
    process = subprocess.Popen(rundocker.split(), stdout=subprocess.PIPE)
except:
    print("Error i cant run your image on docker")
    rmdocker = "docker stop $name"
print("Hold on im testing connection right now ...")
time.sleep(5)
s = socket.socket()
port = 5000

try:
        s.connect((ip, port))
        print("website is up")
except : 
    print("website isnt up")
finally:
        s.close()
