## Hints and pseudo code for Exercise 6.6.1 (Lord of the Fruit Flies)

1. Identify how many papers in the *PubMed* database have the words *Drosophila virilis* in their title or abstract. Use the `usehistory` argument so you can refer to this search in the next step.

	**Hints**: you can use the functuion `Entrez.search` from the `Entrez` module of the `Bio` package. Setting `usehistory = y` allows you to refer to the query in the next step.

	**Pseudocode**:

	```python
	from Bio import Entrez
	import re
	Entrez.email = "your email here"
	# create a handle
	handle = Entrez.esearch(your code here)
	# now retrieve the records
	record = Entrez.read(handle)
	```

2. Retrieve the PubMed entries.

	**Hints**: you can use the function `Entrez.efetch` to retrieve the records. Write the results to the file `D_virilis_pubs.txt`. 


3. Count the number of contributions per author.

	**Hints**: use regular expressions to extract the author names, and count them.

4. Identify the five authors with the most contributions.
 
	**Hints**: you can try using the function [`sorted`](https://www.geeksforgeeks.org/sorted-function-python/) for this task.

