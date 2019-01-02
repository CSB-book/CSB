## Hints and pseudo code for Exercise 1.10.2 (data from Gesquiere *et al.*, 2011)

1. You can use `cut` to extract just the `maleID` from the file; to match the individual 3 (or 27), you can use `grep`. 
2. You want to turn the solution of part 1 into a script; to do so, open a new file and copy the code you've written. Now you can use generic variables `$1` and `$2` as placeholders for the file name and the `maleID`; you can pass these arguments to the command line.
3. First, you need to use `cut` in combination with `tail`, `sort` and `uniq` to extract all the distinct `maleID`. Then the main hurdle is to take the output of this pipeline and use it as input for a for loop in `bash`. The following example should help:

```
#!/bin/bash

# to store the results of a command into a variable,
# surround the command with backticks (`)
myfiles=`ls`
for myfile in $myIDS
do
    echo $myfile
done
```
