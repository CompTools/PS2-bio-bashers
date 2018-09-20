#!/bin/bash

# Bonus question code

FILE=/ufrc/zoo6927/share/biobashers/flights.May2017-Apr2018.csv
# The above line assigns the variable "FILE" to the origina CSV file

read -p "Please enter an airport code, city or state name:" INPUT
# This code allows the user to enter airport information.

file_info=$(cut -d',' -f3,4,5,6,7,8,13,16 $FILE | grep "$INPUT" | grep -c "1.00")
# This code isolates the columns with information on the airport codes, cities, and states and whether 
# there was a 15 minute or greater delay. The information is then piped into a grep command to find the 
# airport information input and then to a grep command to find the number of flights that were delayed.

echo $file_info
# The above command prints the number of flights that were delayed to or from the specified airport.
