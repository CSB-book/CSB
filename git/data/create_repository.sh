#!/bin/bash

# function of the script:
# sets up a repository and
# immitates workflow of
# creating and commiting two text files

mkdir branching_example
cd branching_example
git init
echo "Some great code here" > code.txt
git add .
git commit -m "Code ready"
echo "If everything would be that easy!" > manuscript.txt 
git add .
git commit -m "Drafted paper"
