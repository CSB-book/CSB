## Hints and pseudo code for Exercise 1.10.4 (data from Buzzard *et al.*, 2016)

1. You can select a given column from a `csv` file using the command `cut`. Then,
   - The column name is going to be in the first line (*header*); access it with `head`
   - The number of distinct values can be found by counting the number of lines when you have sorted them and removed duplicates (using a combination of `tail`, `sort` and `uniq`)
   - The minimum and maximum values can be found by combining `sort` and `head` (or `tail`)
   - To write the script, use the generic placeholders `$1` and `$2` for the file name and column number, respectively
