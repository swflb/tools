newIp=$(wget http://hstuff.net/ips/getip.php -q -O -)

#file="~/sync/code/ip.txt"
oldIp=$(cat ./ip.txt)
#echo "date: `date` and new one: $newIp" >> ./testcron.txt
#echo "old one: $oldIp"
if [ -z "$newIp" ]; then
	echo "ERROR: no outside ip found"
	exit 1
else
	if [[ -z "$oldIp" || "$oldIp" != "$newIp" ]]; then
		echo "$newIp" > ./ip.txt
		#echo "newIp: $newIp"
                cat ./email.txt > ./email2.txt
                echo "$newIp" >> ./email2.txt
                ssmtp sethdh@gmail.com < ./email2.txt
	else
		echo "no change"
	fi
fi

