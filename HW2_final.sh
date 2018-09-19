#!/bin/bash

#Homework 2 final code

#Creating file to be used in subsequent questions
cat flights.May2017-Apr2018.csv | cut -d',' -f3,4,5,6,7,8,9,10,13,16,21,24 > HW2_dataset.csv 

#Problem 1 solution
cat HW2_dataset.csv | grep "GNV" | grep -c "1.00"
