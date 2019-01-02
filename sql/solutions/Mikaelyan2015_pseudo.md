## Hints and pseudo code for Exercise 10.11.2 ( Mikaelyan *et al.* 2015)

1. By joining the three tables, create a view displaying `Spp` (species name), `OTU` (code for the OTU), and `Num`, the number of occurrences of the OTU in the gut of the species. Notice that `Num` can be (and often is) `0`.

	**Hints**:

	- to join the tables `tSpp` and `tNumber` you will need to specify the type of join (`INNER` will do), and the field to use to join the tables `IDOTU`
	- write the query first, and when you are happy with the result, create a `VIEW`

2. Count the number of OTUs found in each species (remember to filter using `Num > 0`).

	**Hints**:

	- it is convenient to query the view build at step 1
	- using `WHERE` and `GROUP BY` you should be able to filter out the OTU with `Num = 0` and then compute the number of OTU per species

3. List the OTUs that are found in four or more species

	**Hints**:

	- again, work with the view created in step 1
	- when filtering grouped data, you need to use `HAVING`

4. Delete all the records in tNumber where `Num` is zero.

	**Hints**:

	- beware: this operation cannot be undone
	- if something goes wrong, check out the file from the repository again `git checkout ../data/Mikaelyan2015.db` (you will need to run the code for step 1 again, as this is a fresh version of the database)

5. Using the package vegan in `R`, compute the Shannon's index of diversity for the gut microbial community of each species.

	**Pseudocode**:

	```r
	# load package to connect to database
	library(RSQLite) 
	# load package to compute Shannon's 
	library(vegan)
	# establish connection
	sqlite <- dbDriver("SQLite")
	con <- dbConnect(sqlite, "../data/Mikaelyan2015.db") 
	# see the tables
	print(dbListTables(con)) 
	# to run a query
	res <- dbSendQuery(con, "YOUR QUERY HERE;")
	# store the results
	tSpp <- dbFetch(res, n = -1)
	# print the table
	head(tSpp)

	# now write code to produce a query for each species
	# use diversity(my_freq, index = "shannon") to compute the diversity given the frequencies

	# remember to close the connection!
	dbClearResult(con)
	dbDisconnect(con)
	```

