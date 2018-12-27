## Hints and pseudo code for Exercise 1.10.1 (data from Marra and DeWoody, 2014)

1. To change the directory, you can use the commands explained at page 20.
2. To find the size of a file you can use a modifier of the command `ls`.
3. To copy a file, see page 22.
4. Is there a `grep` option that counts the number of occurrences?
5. To replace single characters, you can use the command `tr` with its options and modifiers.
6. You can use `grep` to match any line containing the word `isogroup`; then use `cut` to isolate the part detailing the isogroup; finally, you want to remove the duplicates (e.g., page 32) and count.
7. Again, you can use a combination of `grep` and `cut` to extract the contig names and read counts; the command `sort` allows you to choose the delimiter as well as ordering numeric values.
