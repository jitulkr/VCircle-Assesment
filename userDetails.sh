#!/bin/bash

now=`date +'%d-%m-%y'`
while true
do
	echo -e "\e[92m Enter the Username: \e[0m "
	read uname
	if [ ${#uname} -gt 6 ]; then echo -e "\e[31m Username length greater than 6, please try again. \e[0m"; exit
	else echo -e "\e[92m Name entry successful. \e[0m"
	fi


	echo -e "\e[36m Enter the Age: \e[0m"
	read age
	re='^[0-9]+$'
	if ! [[ $age =~ $re ]] ; then echo -e "\e[31m Not a number ! \e[0m"; exit
	else echo -e "\e[92m Age entry successful. \e[0m"
	fi

	echo -e "\e[33m Enter the Address: \e[0m" 
	read addrs
	if [ ${#addrs} -gt 30 ]; then echo -e "\e[31m Address Length should be below 30 characters. \e[0m"; exit
	else echo -e  "\e[92m Address entry successful. \e[0m"
	fi


	
	text=updated
	if [ -f /tmp/${uname}*.txt ]; then
		echo "Username exists, updating the file \e[0m"
		echo Name : $uname > /tmp/${uname}_${now}.txt
		echo Age : $age >> /tmp/${uname}_${now}.txt
		echo Address : $addrs >> /tmp/${uname}_${now}.txt
		mv /tmp/${uname}_${now}.txt   /tmp/${uname}_${text}_${now}.txt 
	else
		echo Name : $uname > /tmp/${uname}_${now}.txt
		echo Age : $age >> /tmp/${uname}_${now}.txt
		echo Address : $addrs >> /tmp/${uname}_${now}.txt
	fi
done
