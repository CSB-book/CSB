## Hints and pseudo code for Exercise 8.23.1 (Goldberg *et al.*, 2010)

1. Write a program that counts how many species are in each category of `Status`. The output should be a `data.frame`.

	**Hints**:

	- to read the data, use `read.csv`; remember to set `stringsAsFactors = FALSE`, otherwise the species names will become of type `factor`, and you won't be able to manipulate them
	- there are different ways to solve the exercise; the most straightforward is to cycle through all possible values of `Status`, and count how many occurrences of each are in the data
	- alternatively, check the documentation for the function `table`

	**Pseudocode**:

	```r
	# read the data
	# use read.csv
	possible_status <- extract unique Status
	# create empty data.frame to store results
	results <- data.frame()
	# cycle through the possible values:
	for (status in possible_status) {
	  # count how many occurrences
	  # append to the data frame
	}
	```

2. Write a program that builds a `data.frame` specifying how many species are in each `Status` for each genus (note that each species name starts with the genus, followed by an underscore).

	**Hints**: you will need to extract the genus from the species name; use `strsplit`

	**Pseudocode**:

	```r
	genera <- character(0) # empty vector
	for (each species){
	    # split species name and extract genus
	    # add to genera
	}
	# now use the function table to produce the contingency table
	```

