###################################################
# Exercise 1.10.2 on Gesquiere et al. (2011)
###################################################
# 1) How many times were the levels of individuals
# 3 and 27 recorded?

# First, let's see the structure of the file:

head -n 3 ../data/Gesquiere2011_data.csv 

# maleID	GC	T
# 1	66.9	64.57
# 1	51.09	35.57

# We want to extract all the rows in which the 
# first column is 3 (or 27) and count them.

# To extract only the first column, we can use cut

cut -f 1 ../data/Gesquiere2011_data.csv | head -n 3

# maleID
# 1
# 1

# Then we can pipe the results to grep -c to count
# the number of occurrences (note the flag -w as
# we want to match 3 but not 13 or 23):

# maleID 3

cut -f 1 ../data/Gesquiere2011_data.csv | grep -c -w 3

# 61

# maleID 27

cut -f 1 ../data/Gesquiere2011_data.csv | grep -c -w 27

# 5

###################################################
# 2) Write a script taking as input the file name
# and the ID of the individual, and returning the
# number of records for that ID.

# We just need to a) read the input from the command
# line (using $1 for filename and $2 for ID), and
# then run the commands above.

# The script count_baboons.sh shows the solution

bash count_baboons.sh ../data/Gesquiere2011_data.csv 27

# 5

###################################################
# 3) Write a script that returns the number of
# times each individual was sampled.

# This requires a) extracting all IDs and b) calling
# the script above for each ID

# To get all unique IDs, we need to tail -n +2 the
# file to remove the header, cut -f 1 to extract
# the IDs, and then run through sort | uniq to
# remove the duplicates:

tail -n +2 ../data/Gesquiere2011_data.csv | cut -f 1 | sort -n | uniq

# 1
# 2
# 3
# 4
# ...

# To store this list in a script, you can use

myIDS=`tail -n +2 ../data/Gesquiere2011_data.csv | cut -f 1 | sort -n | uniq`

# And now use a "loop" to cycle through all
# IDs:

for id in $myIDS
do
    mycounts=`bash count_baboons.sh ../data/Gesquiere2011_data.csv $id`
    echo "ID:" $id "counts:" $mycounts
done 

# The file count_all_baboons.sh shows the complete
# script:

bash count_all_baboons.sh

# ID: 1 counts: 10
# ID: 2 counts: 2
# ID: 3 counts: 61
# ...
