#!/bin/bash

#first command cuts the columns needed for exercise 2, in order: ORIGIN, DEST, 
#DEP_DEL15, FLIGHTS, WEATHER_DELAY:

cat flights.May2017-Apr2018.csv | cut -d',' -f3,7,13,21,24 > E2.csv

#second command selects only the flights originating from GNV:

grep -E '^"GNV"' E2.csv > E2col1.csv

#third command sorts the file by the second column, grouping the data by
#by destination:

sort --field-separator="," -k2 E2col1.csv
