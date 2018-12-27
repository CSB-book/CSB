###################################################
# Exercise 1.10.3 on Saavedra & Stouffer (2013)
###################################################
# 1) Write a script that takes one of these files
# and determines the number of rows (pollinators)
# and columns (plants).

# Counting the number of rows amount to counting
# the number of lines. This is easily done with
# wc -l. For example:

wc -l ../data/Saavedra2013/n10.txt 

# Which returns 
# 14 ../data/Saavedra2013/n10.txt

# To avoid printing the file name we
# can either use cat

cat ../data/Saavedra2013/n10.txt | wc -l
# 14

# or use the symbol < for the input

wc -l < ../data/Saavedra2013/n10.txt 
# 14

# Counting the number of columns is more work.
# First, we need only the first line:

head -n 1 ../data/Saavedra2013/n10.txt

# 0 1 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 1 0 0

# Now we can remove all spaces and the line terminator using tr:
head -n 1 ../data/Saavedra2013/n10.txt | tr -d ' ' | tr -d '\n'

# 01000001000000000100

# Finally, we can use wc -c to count the number
# of characters in the string:

head -n 1 ../data/Saavedra2013/n10.txt | tr -d ' ' | tr -d '\n' | wc -c
# 20

# Armed with this information, we can write our
# script (see the file netsize.sh).

###################################################
# 2) Write a script that prints the number of rows
# and columns for each network

# This requires some commands that we haven't covered
# in the text. We put this example to show how many
# problems can be solved by searching the web for
# an answer. You don't need to remember all of the
# commands, but you need to be able to find solutions
# online!

# In a script, if you write:

FILES=../data/Saavedra2013/*.txt

# You create a list of all the .txt files in the
# "variable" FILES. You can then iterate through
# all the files in the directory with a "for"
# loop (more on this when we start programming).
# For example, a script with the line above and

for f in $FILES
do
    echo $f
done

# would print the file names in the directory.

# From the point above, you know how to determine
# the number of rows. You can store the result in
# another variable:

for f in $FILES
do
    myrow=`cat $f | wc -l`
    echo $f $myrow
done

# Note the use of backticks `: the syntax of bash is
# very finnicky, and you need to write the commands
# exactly as above.

# This script prints the file name as well as
# the number of rows. Using these concepts, you can
# write the script netsize_all.sh

###################################################
# 3) Which is the network with the largest number
# of rows? Which the one with the largest number of
# columns?

# Having written the script netsize_all.sh, you can
# take its output and order it according to rows or
# columns:

bash netsize_all.sh | sort -n -r -k 2 | head -n 1

# ../data/Saavedra2013/n58.txt 678 90

# Which gives you the file name with the largest
# number of rows. Similarly:

bash netsize_all.sh | sort -n -r -k 3 | head -n 1

# ../data/Saavedra2013/n56.txt 110 207

# Gives you the file with the largest number of
# columns.
