## Hints and pseudo code for Exercise 1.10.3 (data from Saavedra and Stouffer, 2013)

1. To build the script, you need to combine several commands:
   - To find the number of rows, you can use `wc`
   - To find the number of columns, take the first line, remove the spaces, remove the line terminator `\n` and count characters.
   - To combine them in a script, you need to assign the result of a command to a variable. For example: ``mytxtfiles=`ls *.txt` `` stores the list of `txt` files in the variable `mytxtfiles`.
   
2. You need to write a `for` loop in a bash script. This might help:

```
!#/bin/bash

myfiles=`ls *.txt`
for ff in myfiles
do
echo $ff
done
```

3. You can now use the script you've just written in combination with `sort` to answer the questions (remember the option `-k` to choose a column and `-r` to reverse the order).
