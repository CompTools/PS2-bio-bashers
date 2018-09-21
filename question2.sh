#!/bin/bash

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

cat E2col1.csv | grep "ATL" | cut -d',' -f5 | grep '^\S*' | grep -v 0.00 | grep -cE '[[:digit:]]{1,}' > atldw.txt
cat E2col1.csv | grep "CLT" | cut -d',' -f5 | grep '^\S*' | grep -v 0.00 | grep -cE '[[:digit:]]{1,}' > cltdw.txt
cat E2col1.csv | grep "MIA" | cut -d',' -f5 | grep '^\S*' | grep -v 0.00 | grep -cE '[[:digit:]]{1,}' > miadw.txt

#creating fourth column

cat cltdw.txt >> atldw.txt
cat miadw.txt >> atldw.txt

paste firstc.txt secondc1.txt atld.txt atldw.txt > table.txt
less table.txt


