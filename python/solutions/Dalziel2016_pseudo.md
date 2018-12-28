## Hints and pseudo code for Exercise 3.8.1 (data from Dalziel *et al.*, 2016)

1. Write a program that extracts the names of all the cities in the database (one city per entry)

	**Hints** each city is reported several times: we need a way to remove duplicates. For example, we could use a `set`. We will need to read a `csv` file: this task is easier if you import the `csv` module.

	**Pseudocode**:

	```python
	import csv
	cities = an empty set
	open data for reading
	create dictionary reader
	for each row in the file
	    add the city to the set
	```

2. Write a program that creates a dictionary where the keys are the cities, and the values are the number of records (rows) for that city in the data.

	**Hints** now we need to keep track of the number of occurrences for each city. A good data structure for this task is a `dictionary` in which cities are the `keys` and the `values` store the number of occurrences. Note that each time you see a new city, you need to add it to the dictionary. To do this, you can use the method `get` for dictionaries, which allows you to initialize a default value for a key that is not already present in the dictionary. For example, the code:

	```python
	dd = {} # empty dictionary
	my_list = ['a', 'b', 'a', 'c', 'd', 'b', 'a']
	for element in my_list:
	    dd[element] = dd.get(element, 0) + 1
	```

	returns

	```python
	{'a': 3, 'b': 2, 'c': 1, 'd': 1}
	```

	**Pseudocode**:

	```python
	import csv library
	citycount = an empty dictionary
	open file for reading
	set up dictionary reader
	    for each line in data
		my_city = extract the city
		citycount[my_city] = use get to update value
	```

3. Write a program that calculates the mean population for each city, obtained by averaging the value of pop.

	**Hints** to compute the mean, keep summing the population for the city, and at the end divide by the number of records. A good data structure for this problem would be a dicitionary in which cities are `keys`, and the total population and the number of occurrences are stored in a list.

	**Pseudocode**:

	```python
	import csv
	citypop = an empty dictionary
	open data file reading
	set up dictionary reader
	for each line in data
	       my_city = extract the city
	       my_pop = extract population
	       if this is the first time you see this city, initialize:
		 citypop[my_city] = [0.0, 0]
	       citypop[my_city][0] = what it was before + my_pop
	       citypop[my_city][1] = what it was before + 1

	for each city
	    divide the first element by the second to obtain the mean
	```

4. Write a program that calculates the mean population for each city and year.

	**Hints** while the task is similar to the exercise above, we need to build a more complex data structure. For each city and each year, we should find multiple records and we need to average the population for each year. A good data structure would be a `dictionary` where each key is a city, and the value is another `dictionary` where keys are years, and the values are a list storing the population for that year, and the number of occurrences.

