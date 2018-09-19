#!/bin/bash

# Question 4 code

cat HW2_dataset.csv | grep -oE '[[:alpha:]]{1,}, FL' | uniq > Total_Florida_airports2.txt 
# The above command only pulls out Florida cities with airports. 
# But I'm still struggling with finding a way to print a list with no duplicate cities using uniq. 
# This is the same issue I've had with Question 3.

