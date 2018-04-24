#!/bin/bash

echo "Filename:"
echo $1
echo "Number of rows:"
cat $1 | wc -l
echo "Number of columns:"
head -n 1 $1 | tr -d ' ' | tr -d '\n' | wc -c
