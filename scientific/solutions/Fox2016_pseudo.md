## Hints and pseudo code for Exercise 6.6.2 (Fox *et al.*, 2016)

1. Import the data using pandas , and count the number of reviewers (by summing `ReviewerAgreed`) for each manuscript (i.e., unique `MsID`). The column `FinalDecision` contains `1` for rejection, and `0` for acceptance. Compile a table measuring the probability of rejection given the number of reviewers. Does having more reviewers increase the probability of being rejected?

	**Hints**: it is convenient to write a function that takes the data and a year as input, and prints the probability of rejection given the number of reviewers for that given year. We can set the function to return the general rejection rate if `all` is specified instead of the year. 

	**Pseudocode**:

	```python
        import pandas
	import numpy as np
        # read the data using pandas
	fox = pandas.read_csv("../data/Fox2015_data.csv")
        use a combination of list and set to extract the unique `MsID`

	now go through each manuscript and store
	i) the final decision (reject/accept) in the np.array final_decision
        ii) the number of reviewers in the np.array num_reviewers
        iii) the submission year in the np.array year

	def get_prob_rejection(my_year = "all"):
	if my_year == "all":
	   do not subset the data
	else:
	    subset the data to use only the specified year
	for each number of reviewers:
	    compute probability of rejection and produce output
	```

2. Write a function to repeat the analysis above for each year represented in the database. 

	**Hints**: if you have written the function `get_prob_rejection` as specified above, this part is more straigthforward to implement.
