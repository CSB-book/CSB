## Hints and pseudo code for Exercise 5.9.2 (Map of Science)

1. Read the file pubmed_results.txt, and extract all the US ZIP codes.

	**Hints**: one difficulty is that the ZIP codes could be split over two lines. For example, see line 43 onward:

	```
	AD  - Biological and Biomedical Sciences Program, Harvard Medical School, Boston, MA
	      02115, USA. Department of Genetics, Harvard Medical School, Boston, MA 02115,
	      USA.
	```

	- it is convenient to read all the text at once (open `pubmed_results.txt` as `f` and then use `my_text = f.read()`
	- now use regex to substitute the newline (`\n`) followed by six spaces with a single space
	- now that all ZIP codes are of the form `2-LETTER-STATE 6-DIGITS, USA` write a regex to extract them all.

	**Pseudocode**:

	```python
	open the file and read all of the text using f.read()
	my_text = re.sub(your regex here, ' ', my_text)
        use re.findall to extract all ZIP codes
	zipcodes = re.findall(another regex here, my_text)
	```

2. Create the lists `zip_code`, containing the ZIP codes, `zip_long`, `zip_lat`, and `zip_count`, containing the unique ZIP codes, their longitude, latitude, and count (number of occurrences in Science), respectively

	**Hints**: you need to first count the number of ZIP codes, and then extract the corresponding longitude and latitude from the file `zipcodes_coordinates.txt`.

	**Pseudocode**: 

	```python
	# list of distinct zipcodes
	unique_zipcodes = list(set(zipcodes))
	for each zipcode:
	   extract number of occurrences
	   extract latitude and longitude from zipcodes_coordinates.txt
	```

