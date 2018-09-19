#!/bin/bash

FILE= /ufrc/zoo6927/share/nhouse/flights.May2017-Apr2018.csv

read -p "Please enter an airport code, city or state name:" INPUT 

# We can verify whether the INPUT is storing by using the command: && echo "$INPUT"
#cat flights.May2017-Apr2018.csv | cut -d',' -f3,7,13,16 | grep "GNV" | grep -c "1.00" 

file_info= cut -d',' -f3,4,5,6,7,8,13,16 | grep "$INPUT" | grep -c "1.00" $FILE 

#cat flights.May2017-Apr2018.csv | cut -d',' -f3,7,13,16 | grep "GNV" | grep -c "1.00" 
 
echo $file_info 

#then   
#	echo "Number of flights = '$file_info'"
#else 
#echo "Wrong input" 

#fi 

#total flights are in column 24 
 
