#!/bin/bash
# create by Mladen Simeonovic, 3668

search_dir="passwords" # Name of dir. for passwords(encrypt)

#Banner
echo "================="
echo "-Basic Bash Auth-"
echo "-----------------"
echo "      Login"
echo "================="

#User input
echo -n "Your username: "
read uname
unameMod=$search_dir"/"$uname".bin"

echo ""
echo -n "Your password: "
read -s pass
echo ""

#Search for username/files(password)
for name in "$search_dir"/*
do
	if [[ "$unameMod" == "$name" ]]
	then
		passDec=$(openssl rsautl -inkey key.txt -decrypt < $unameMod) #Decrypt user password
		
		#Check password
		if [[ "$pass" == "$passDec" ]] 
		then
			echo "Welcome "$uname
		else
			echo "Invalid username or password!"
			exit 0
		fi
	fi
done

