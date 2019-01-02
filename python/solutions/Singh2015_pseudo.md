## Hints and pseudo code for Exercise 3.8.2 (data from Singh *et al.*, 2015)

Compute the mean `RecombinantFraction` for each Drosophila `Line` and `InfectionStatus`. Print the results like:

```
Line 45 Average Recombination Rate: 
W : 0.187 
I : 0.191
```

**Hints** as always, the key is to choose the right data structure. For each `Line`, you need to keep track of all the recombination rates for `W` (wounded) and `I` (infected). For example, you could build a dictionary of dictionaries in which the first dictionary is indexed by `Line`, and the inner dictionary by the status (`W` or `I`); then, append all the rates to a list and average at the end.

**Pseudocode**:

```python
import csv
my_data = an empty dictionary
open the file for reading
set up dictionary reader
for each row:
   my_line = extract line
   my_status = extract status
   my_recombination = extract recombination
   if my_line is not in my_data:
       initialize the key in the outer dictionary (e.g., to {'W' = [], 'I' = []})
   append my_recombination to the list in my_data[my_line][my_status]

now cycle through the lines
for line in my_data:
   for 'W' and 'I':
     average = sum all elements and divide by number of elements
```
