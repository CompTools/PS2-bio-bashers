#!/bin/bash

# Question 4 code

cat HW2_dataset.csv | grep -oE '[[:alpha:]]{1,}, FL' | sort -u > Unique_FL_airports.txt 
# The above command uses grep to only pull out Florida cities with airports and print a list of all airports in alphabetical order.
