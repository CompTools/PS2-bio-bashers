#!/bin/bash


# I made a new file named delay1.csv with the 3 columns we need
cat flights.May2017-Apr2018.csv | cut -d',' -f3,7,13,16 > delay1.csv

#Filtering from all the airports to just GNV. The final file is named GNV.csv
grep "GNV" delay1.csv > GNV.csv

#This is the command to get the final count of the flights that were delayed (arrival and dep) 
grep -c "1.00" GNV.csv

