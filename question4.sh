#!/bin/bash

# Question 4 code

cat airportcodesstates.csv | grep \"FL\" | grep -oE '\"[[:alpha:]][[:alpha:]][[:alpha:]]\",\"FL\"' > allFLairports.csv
# cut -d',' -f1 allFLairports.csv | uniq # This outputs around 400K lines - that's why I commented it out for now
# I'm having the same issue as with question 3 as to output the aairport codes without duplicates.

