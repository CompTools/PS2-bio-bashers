#!/bin/bash

# Question 3 code

cut -d',' -f1 HW2_dataset.csv | uniq | grep -E '"[[:alpha:]][[:alpha:]][[:alpha:]]"' > originanddest.txt
# The above line isolates the column of origin airport codes and outputs that to the file "originanddest.txt"
cut -d',' -f5 HW2_dataset.csv | uniq | grep -E '"[[:alpha:]][[:alpha:]][[:alpha:]]"' >> originanddest.txt
# The above line isolated the column of destination airport codes and adds that as output to the file "originanddest.txt"
sort -u originanddest.txt > unique_airport_codes.txt
# The list of airport codes in alphabetical order is outputted in the file "unique_airport_codes.txt"
