#!/bin/bash
# create by Mladen Simeonovic, 3668

search_dir="passwords" # Name of directory for passwords(encrypt)

echo -n "Your username: "
read uname
echo ""

# Search all of files(passwords)
for name in "$search_dir"/*
do
	unameMod=$search_dir"/"$uname".bin"
	if [[ "$unameMod" == "$name" ]]
	then
		echo "Username already exist!"
		exit 0
	fi
done

	echo -n "Your password: " 
	read -s pass 
	echo ""
	echo -n "Repeat your password: "
	read -s rePass

	if [[ "$rePass" == "$pass" ]]
	then
		echo $pass | openssl rsautl -inkey key.txt -encrypt > $unameMod #Encrypt user password
	else
		echo "Passwords doesn't match!"
		exit 0 
	fi
