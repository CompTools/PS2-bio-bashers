#!/bin/bash

#first command cuts the columns needed for exercise 2, in order: ORIGIN, DEST, 
#DEP_DEL15, FLIGHTS, WEATHER_DELAY:

cat flights.May2017-Apr2018.csv | cut -d',' -f3,7,13,21,24 > E2.csv

#second command selects only the flights originating from GNV:

grep -E '^"GNV"' E2.csv > E2col1.csv

#third command sorts the file by the second column, grouping the data by
#by destination:

sort --field-separator="," -k2 E2col1.csv

#fourth command selects the number of delayed flights by 15 minutes or more
#for each of the 3 destinations:

cat E2col1.csv | grep "ATL" | cut -d',' -f3 | grep -w "1.00" -c
cat E2col1.csv | grep "CLT" | cut -d',' -f3 | grep -w "1.00" -c
cat E2col1.csv | grep "MIA" | cut -d',' -f3 | grep -w "1.00" -c

#fifth command selects number of delayed flights due to weather

cat E2col1.csv | grep "ATL" | cut -d',' -f5 | grep '^\S*' | grep -v 0.00 | grep -cE '[[:digit:]]{1,}'
cat E2col1.csv | grep "CLT" | cut -d',' -f5 | grep '^\S*' | grep -v 0.00 | grep -cE '[[:digit:]]{1,}'
cat E2col1.csv | grep "MIA" | cut -d',' -f5 | grep '^\S*' | grep -v 0.00 | grep -cE '[[:digit:]]{1,}'


