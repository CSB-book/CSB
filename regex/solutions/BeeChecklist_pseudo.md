## Hints and pseudo code for Exercise 5.9.1 (Bee Checklist)

1. What is the name of the author with most entries in the database?

	**Hints**: the difficult part of the exercise is to write a regular expression capable of capturing a wide variety of styles used to store the authors' names. To make this simpler:

	- build a regular expression that captures the author names and the dates as separate strings. Note that there might (or might not) be a parenthesis at the beginning/end of the string; the initials for the authors might (or might not) be reported, author names can be split using commas or ampersands; some names are hyphenated. To make sure you've captured all authors, check that the number of names matches the number of records. 
	- write a second regular expression that splits the list of authors using commas or &.

	**Pseudocode**:

	```python
	open the file
        extract species name
        extract author/date string
        use re.findall to extract i) author list, ii) date
        now go through each author list, and split the authors
	```

	- if you store the number of records for each author in a dictionary (key: author name, value: number of records), you can find the maximum value using `max_value_author = max(dict_authors.values())`; then you can use the function `index` on the keys of the dictionary to extract the name associated with the maximum value.

2. Which year of publication is most represented in the database?

	**Hints**: you can use the same strategy by building a dictionary where keys are years, and values are the number of records for each year.

