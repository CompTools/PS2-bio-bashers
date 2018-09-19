#!/bin/bash

# Question 3 code

cut -d',' -f1 HW2_dataset.csv | uniq | grep -E '"[[:alpha:]][[:alpha:]][[:alpha:]]"' > originanddest.txt
cut -d',' -f5 HW2_dataset.csv | uniq | grep -E '"[[:alpha:]][[:alpha:]][[:alpha:]]"' >> originanddest.txt

uniq originanddest.txt > unique_airport_codes.txt
# uniq is still printing clear duplicates in this list of airport codes
