#!/usr/bin/env python3

import pandas as pd

import numpy as np

datafile = pd.read_csv("/ufrc/zoo6927/share/mariacortez/flights.May2017-Apr2018.csv")

print(datafile.head())

datafile_item2 = datafile[['ORIGIN', 'CANCELLED']]

print(datafile_item2.head(100))

just_cancelled = datafile_item2.loc[datafile_item2['CANCELLED'] == 1.00]

print(just_cancelled.head(100))

grouped	= just_cancelled.groupby('ORIGIN')
 
sum_airports = grouped.sum()

sorted_airports = sum_airports.sort_values('CANCELLED', ascending=False)

print(sorted_airports.head(100))

#unique_airports = np.unique(just_cancelled.ORIGIN)

#print(unique_airports)

#print(len(unique_airports))



















