#Created Friday April 20, 2012
#Author Areux.
#Don't really care if you change this script and take all the credit 

import sys
from subprocess import call

citycode = sys.argv[1]
header = "\"Sky conditions\""
url = "\"http://weather.noaa.gov/weather/current/"+citycode+".html\""
weather = call("w3m -dump "+url+" | grep -A0 "+header+" > ~/.conky_scripts/weathercondition", shell=True)
f = open("weathercondition")
cond = f.readline().replace('Sky conditions', '').strip()
f.close()

def printIcon():

	if cond == 'partly cloudy' or cond == 'mostly cloudy':
		print 'c'
	elif cond == 'fair' or cond == 'sunny':
		print 'A'
	elif cond == 'cloudy':
		print 'e'
	elif cond == 'storm' or cond == 'thunder': 
		print 'i'
	elif cond == 'snow':
		print 'k'
	elif cond == 'rain' or cond == 'Light rain':
		print 'h'
	elif cond == 'shower':
		print 'g'

if __name__ == "__main__":
 	printIcon()


