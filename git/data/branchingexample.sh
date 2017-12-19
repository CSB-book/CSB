#!/bin/bash

cd ../sandbox
mkdir tracked_project
cd tracked_project
git init
echo "Some great code here" > code.txt
git add .
git commit -m "Code ready"
echo "If everything would be that easy!" > manuscript.txt 
git add .
git commit -m "Drafted paper"
