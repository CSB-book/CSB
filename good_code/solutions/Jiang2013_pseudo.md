## Hints and pseudo code for Exercise 4.10.1 (data from Jiang *et al.*, 2013)

1. Write a function that takes as input the desired `Taxon`, and returns the mean value of `r`

	**Hints**: 

	- first of all, we need to read in all the `r` values for each `Taxon`. For example, you might store them in a list (or a dictionary where each key is a taxon, and the value is a list of `r` values). 

	```python
	import csv

	taxa = []
	r_values = []

	open the file and set up dictionary reader
	for each row:
	   append to taxa
	   append to r_values
	```

	- now you need to write a function that takes as input the two lists, as well as a target taxon and computes the average `r`:

	```python
	def compute_avg_r(taxa, r_values, target_taxon = "Fish"):
	    avg_taxon = 0.0
	    num_occurrences = 0
	    cycle through the values of taxa
	       every time you find the right taxon, add its r value to avg_taxon
	       and increment num_occurrences
	    at the end, divide avg_taxon by num_occurrences and return the average
	```

2. You should see that fish have a positive value of r, but that this is also true for other taxa. Is the mean value of r especially high for fish? To test this, compute a p-value by repeatedly sampling 37 values of r at random (37 experiments on fish are reported in the database), and calculating the probability of observing a higher mean value of r. To get an accurate estimate of the p-value, use 50,000 randomizations.

	**Hints**: the idea is the following:

	- for the target taxon, compute the mean r value, and store it
	- now sample at random values (as many as the number of occurrences), and average them
	- keep a tally of how many times do you find a higher value than the one observed
	- the proportion of times this happens is the approximate p-value

	To sample at random, you need to use a function from `scipy` (for example, to shuffle the names of the taxa, or the values associated with the taxa)

	**Pseudocode**:

	```python
	def compute_pvalue(taxa, r_values, target_taxon = "Fish", num_rep = 1000):
	    observed_r = compute the mean for the observed average r value
	    pvalue = 0.0
	    for i in range(num_rep):
	       shuffle the r values
	       random_r = compute the mean using the shuffled values
	       if random_r >= observed_r:
		   increment pvalue
	    now divide pvalue by num_rep and return
	```

3. Repeat the procedure for all taxa.

	**Hints**: this is why having written a function is really good. You need to extract all taxa names from the list, and launch the function for each taxon.
