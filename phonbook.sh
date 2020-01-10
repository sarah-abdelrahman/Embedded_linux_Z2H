#!/bin/bash

#read -p "enter your name" name

if [ -f database ]
then
	echo " "
else
	touch database
fi


case $1 in

"-v")
	echo "all records \n"
	cat database;;
"-e")
	rm database
	echo "all records removed";;
"-i")
	space="   "
	read -pp "enter full name " name
	read -p "enter phone " phone
	echo $name$space$phone >> database ;;
"-s")
	read -p "enter full name: " name	
	if grep -q "^$name" database; then
    	echo found
	grep "^$name" database
	else
    	echo not found
	fi

;;

"-d")
	flag=1
	while [ $flag -eq 1 ]
	do
		read -p "enter full name you want to delete:  " xname
		grep "^$xname" database

		read -p "are you sure you want to delete all these records yes > y no > n: " flag1
		case $flag1 in
		'n')
			flag=1;;
		'y')
		flag=0
		sed -i_bak -e "/^$xname/d" database
		;;
		esac
	done

;;

*)

echo 'invalid input'
echo ' please enter'
echo '-i for inserting new recored'
echo '-v for viewing all records'
echo '-e for erasing all records'
echo '-d for deleting certian record'
echo '-s for searching '

esac
