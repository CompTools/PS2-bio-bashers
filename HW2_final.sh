#!/bin/bash

#Homework 2 final code

#Creating file to be used in subsequent questions
cat flights.May2017-Apr2018.csv | cut -d',' -f3,4,5,6,7,8,9,10,13,16,21,24 > HW2_dataset.csv 

#Problem 1 solution
cat HW2_dataset.csv | cut -d',' -f1,2,3,4,5,6,9,10 | grep "GNV" | grep -c "1.00"


#Problem 2 Solution
#first command cuts the columns needed for exercise 2, in order: ORIGIN, DEST,
#DEP_DEL15, FLIGHTS, WEATHER_DELAY:

cat flights.May2017-Apr2018.csv | cut -d',' -f3,7,13,21,24 > E2.csv

#second command selects only the flights originating from GNV:

grep -E '^"GNV"' E2.csv > E2col1.csv

#creating first column

cat E2col1.csv | cut -d ',' -f2 | sort -u > firstc.txt

#third command sorts the file by the second column, grouping the data by
#by destination:

sort --field-separator="," -k2 E2col1.csv > sort_by_second_c.txt

cat E2col1.csv | grep -c "ATL" > secondc1.txt
cat E2col1.csv | grep -c "CLT" > secondc2.txt
cat E2col1.csv | grep -c "MIA" > secondc3.txt

#creating a second column

cat secondc2.txt >> secondc1.txt
cat secondc3.txt >> secondc1.txt

#fourth command selects the number of delayed flights by 15 minutes or more
#for each of the 3 destinations:

cat E2col1.csv | grep "ATL" | cut -d',' -f3 | grep -w "1.00" -c > atld.txt
cat E2col1.csv | grep "CLT" | cut -d',' -f3 | grep -w "1.00" -c > cltd.txt
cat E2col1.csv | grep "MIA" | cut -d',' -f3 | grep -w "1.00" -c > miad.txt

#creating third column

cat cltd.txt >> atld.txt
cat miad.txt >> atld.txt

#fifth command selects number of delayed flights due to weather

cat E2col1.csv | grep "ATL" | cut -d',' -f5 | grep '^\S*' | grep -v 0.00 | grep -cE '[[:digit:]]{1,}' > at$
cat E2col1.csv | grep "CLT" | cut -d',' -f5 | grep '^\S*' | grep -v 0.00 | grep -cE '[[:digit:]]{1,}' > cl$
cat E2col1.csv | grep "MIA" | cut -d',' -f5 | grep '^\S*' | grep -v 0.00 | grep -cE '[[:digit:]]{1,}' > mi$

#creating fourth column

cat cltdw.txt >> atldw.txt
cat miadw.txt >> atldw.txt

paste firstc.txt secondc1.txt atld.txt atldw.txt > table.txt
echo -e "GNV to:\tTotal flights\tTotal flights delayed (>15min)\tTotal flights delayed due to Weather" > h$
cat table.txt >> header.txt
less header.txt

#Problem 3 Solution
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
