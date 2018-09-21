#!/bin/bash

#Homework 2 final code

#Creating file to be used in subsequent questions
cat flights.May2017-Apr2018.csv | cut -d',' -f3,4,5,6,7,8,9,10,13,16,21,24 > HW2_dataset.csv 

#Problem 1 solution
cat HW2_dataset.csv | grep "GNV" | grep -c "1.00"

# Problem 3 Solution
question3_function () {
cut -d',' -f1 HW2_dataset.csv | uniq | grep -E '"[[:alpha:]][[:alpha:]][[:alpha:]]"' > originanddest.txt
# The above line isolates the column of origin airport codes and outputs that to the file "originanddest.txt"
cut -d',' -f5 HW2_dataset.csv | uniq | grep -E '"[[:alpha:]][[:alpha:]][[:alpha:]]"' >> originanddest.txt
# The above line isolated the column of destination airport codes and adds that as output to the file "originanddest.txt"
sort -u originanddest.txt > unique_airport_codes.txt
# The list of airport codes in alphabetical order is outputted in the file "unique_airport_codes.txt"
}
question3_function 
# The above line executes the function within the bash script and thus produces the list of airport codes in the file "uniqure_airport_codes.txt"

# Problem 4 solution
question4_function () {
cat HW2_dataset.csv | grep -oE '[[:alpha:]]{1,}, FL' | sort -u > Unique_FL_airports.txt 
# The above command uses grep to only pull out Florida cities with airports and print a list of all airports in alphabetical order.
}
question4_function
# The above line executes the function within the bash script and creates a list of airport codes in the file "Unique_FL_airports.txt"
