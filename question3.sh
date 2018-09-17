#!/bin/bash

# Question 3 code

head flights.May2017-Apr2018.csv | cut -d',' -f3,6,7,10 > airportcodesstates.csv
cut -d',' -f1 airportcodesstates.csv | uniq | grep -E '"[[:alpha:]][[:alpha:]][[:alpha:]]"' ;
cut -d',' -f3 airportcodesstates.csv | uniq | grep -E '"[[:alpha:]][[:alpha:]][[:alpha:]]"' > originanddest.csv
uniq originanddest.csv
# I can't find a way to print a list of airport codes with no duplicates. I'll keep working at it.
