#!/bin/bash

echo -e "\nscaning cache files..."

PROC=$(lsof | grep Flash | awk '{print $2;exit}';) 
if [ -n $PROC ]
	then
		# echo "process found"
		FILES=$(file /proc/$PROC/fd/* | grep Flash | awk '{print $1}') # get the locations
		NUM=$(echo $FILES | wc -w) # find the number of found locations
		
		echo -e "\n-----------------------\nFound $NUM file(s)\n-----------------------"
		
		for x in $FILES
			do
				NAME="$RANDOM.flv" # generate a random file name
				echo -n "saving => "
				cat ${x%?} > "$HOME/$NAME" # save the file
				du -h "$HOME/$NAME" # display the file size and file location
		done
	
	else
		echo "Nothing found"
fi

echo -e "\ndone"
