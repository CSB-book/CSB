#!/bin/bash

# $1 is the file name
# $2 is the column of interest

echo "Column name"
cut -d ',' -f $2 $1 | head -n 1
echo "Number of distinct values:"
cut -d ',' -f $2 $1 | tail -n +2 | sort | uniq | wc -l
echo "Minimum value:"
cut -d ',' -f $2 $1 | tail -n +2 | sort -n | head -n 1
echo "Maximum value:"
cut -d ',' -f $2 $1 | tail -n +2 | sort -n | tail -n 1
