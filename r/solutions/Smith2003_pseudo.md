## Hints and pseudo code for Exercise 8.23.2 (Smith *et al.*, 2003)

1. Write a script (`read_mass.R`) that reads and cleans the data.

	**Hints**:

	- the separator is a `Tab`: use `read.table` with `sep = '\t'` and `stringsAsFactors = FALSE`
	- there are no headers; use `colnames` to set them
	- the Authors used `-999` for "not available"; use `NA` instead

2. Write another script (`body_mass_family.R`), which calls `read_mass.R`, and then calculates the average body mass per Family.

	**Hints**: there are many ways to accomplish this, and in fact, point 4 asks to write the code in a different way. Possible strategies (among many):

	- first extract `Family` names, then cycle through the families, and for each compute the average body mass
	- go through each record, and add to a `data.frame` the family and the body mass if it is not already present; if it is present, just add the body size; keep track of the number of species by family, as at the end you will need this value to compute the average.
	- use the compact command `by`

	**Pseudocode**:

	```r
	all_families <- sort(unique(dt$Family))
	results <- data.frame()
	for (each family){
	    extract the body mass for the species in family
            exponentiate (they are stored in log)
            average (set na.rm = TRUE) to remove Not Available
	}
	```
3. Measure the time it takes to run the analysis.

4. There are many ways to accomplish this task. Rewrite the analysis using an alternative method, make sure it returns the same results, and time the alternative solution. Which one is more readable? Which one is faster?

	Try implementing one of the other methods suggested above and consider advantages and disadvantages.

