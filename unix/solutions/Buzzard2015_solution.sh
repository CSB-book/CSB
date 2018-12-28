###################################################
# Exercise 1.10.4 on Buzzard et al. (2016)
###################################################
# 1)  Write a script that, for a given csv file and
# column number, prints:
# - Column name
# - Number of distinct values
# - Minimum value
# - Maximum value

# First, we need to extract the column name.
# For example, for the Buzzard data file, and col 7

cut -d ',' -f 7 ../data/Buzzard2015_data.csv | head -n 1

# biomass

# Second, we need to obtain the number of
# distinct values. We can sort the results
# (after removing the header), and use uniq

cut -d ',' -f 7 ../data/Buzzard2015_data.csv | tail -n +2 | sort | uniq | wc -l

# 285

# Third, to get the max/min value we can use
# the code above, sort using -n, and either
# head (for min) or tail (for max) the result.

# Minimum
cut -d ',' -f 7 ../data/Buzzard2015_data.csv | tail -n +2 | sort -n | head -n 1

# 1.048466198

# Maximum
cut -d ',' -f 7 ../data/Buzzard2015_data.csv | tail -n +2 | sort -n | tail -n 1

# 14897.29471

# The file explore.sh is possible incarnation
# of the script.

# For example:

bash explore.sh ../data/Buzzard2015_data.csv 6

# Column name
# Abund.n
# Number of distinct values:
# 46
# Minimum value:
# 1
# Maximum value:
# 157

# This works well also for alphabetical order:

bash explore.sh ../data/Buzzard2015_data.csv 3

# Column name
# genus
# Number of distinct values:
# 85
# Minimum value:
# Acacia
# Maximum value:
# Zanthoxylum
