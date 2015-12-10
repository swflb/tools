#Created Friday April 20, 2012
#Author Areux.
#Don't really care if you change this script and take all the credit 

import os
import sys
from subprocess import call


#curpath = os.path.abspath(os.curdir)
#print curpath
#print os.path.join(curpath, "weathertemp")

citycode = sys.argv[1]
header = "\"Temperature\""
url = "\"http://weather.noaa.gov/weather/current/"+citycode+".html\""
weather = call("w3m -dump "+url+" | grep -A0 "+header+" > ~/.conky_scripts/weathertemp", shell=True)
f = open("weathertemp")
line = f.readline().strip()
f.close()
a= line.find('(')
b= line.find(')')
temp = int(line[a+1:b-2])

def printIcon():
	if temp <= -15:
		print 'x'
	elif -15 < temp < 20:
		print 'y'
	elif temp >= 20:
		print 'z'

if __name__ == "__main__":
 	printIcon()



 
