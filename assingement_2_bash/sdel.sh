#!/bin/bash
if [ -d ~/TRASH ]
then
	~/TRASH -name *.tar.gz -type f -atime +2 -delete
else
	mkdir ~/TRASH
fi
if [ $# > 0 ]
then
	if [ -f $1 ] || [ -d $1 ]
	then
		if file "$1" | grep -q "gzip"
		then
			mv $1 ~/TRASH
		else
			tar czf $1.tar.gz $1
			mv $1.tar.gz ~/TRASH
			rm $1
		fi
	else
		echo "File not found"
	fi
else
	echo "Please enter file name after safe delete"
fi
