## Hints and pseudo code for Exercise 4.10.2 (data from Lahti *et al.*, 2014)

1. Write a function that takes as input a dictionary of constraints (i.e., selecting a specific group of records) and returns a dictionary tabulating the BMI group for all the records matching the constraints. For example, calling:
	```
	get_BMI_count({'Age': '28', 'Sex': 'female'})
	```
	should return:
	```
	{'NA': 3, 'lean': 8, 'overweight': 2, 'underweight': 1}
	```

	**Hints**: the main hurdle is to check that a given record matches all the constraints provided by the user. The strategy is as follows:

	   - open the file for reading and initialize the csv reader
	   - for each row, check whether all the constraints are satisfied
	   - if so, include in the summary

	**Pseudocode**:

	```python
	def get_BMI_count(dict_constr):
	   open the file and set up the csv reader
	   for each row:
	      add_to_count = True
	      for each constrain in dict_constr:
		 if constraint is not met:
		     add_to_count = False
	      if add_to_count:
		 all the constraints are respected
		 add to the tally
	   return the result
	```

2. Write a function that takes as input the constraints (as above), and a bacterial "genus". The function returns the average abundance (in logarithm base 10) of the genus for each group of BMI in the sub-population. For example, calling:

	```
	get_abundance_by_BMI({'Time': '0', 'Nationality': 'US'}, 'Clostridium difficile et rel.')
	```

	should return:

	```
	____________________________________________________________________
	Abundance of Clostridium difficile et rel. In sub-population:
	____________________________________________________________________
	Nationality -> US
	Time -> 0
	____________________________________________________________________
	3.08      NA
	3.31      underweight
	3.84      lean
	2.89      overweight
	3.31      obese
	3.45      severeobese
	____________________________________________________________________
	```

	**Hints**: to write the function, you need 1) to open the file `Metadata.tab`, and extract the `SampleID` corresponding to the constraints specified by the user (you can use a list to keep track of all IDs); 2) open the file `HITChip.tab` to extract the abundances matching the genus specified by the user (and for the ID stored in step 1). 

	**Pseudocode**:

	```python
	def get_abundance_by_BMI(dict_constraints, genus = 'Aerococcus'):
	    open the file Metadata.tab extract matching IDs using the same 
	    approach as in exercise 1
	    these IDs are stored in BMI_IDs

	    Now open HITChip.tab, and keep track of the abundance of the genus for each 
	    BMI group
	    finally, calculate means, and print results
	    note that you want to take the log (scipy.log10) after having computed the mean
	```

3. Repeat this analysis for all genera, and for the records having `Time = 0`

	**Hints**: the genera are contained in the header of the file `HITChip.tab`. Extract them from the file and store them in a list. Then you can call the function `get_abundance_by_BMI({'Time': '0'}, g)`, where `g` is the genus; cycle through all genera.
