## Hints and pseudo code for Exercise 10.11.1 (Zmihorski *et al.* 2015)

1. Each `Area` contains several sites (`PointID`). Calculate the average `Species.richness` for each area.

	**Hints**: 

	- field names containing punctuation need to be listed between quotes
	- the function `AVG` computes the mean given a set of values
	- ordering by `Area` will produce more readable results

2. Calculate the average `Species.richness` for each `Area`/`Year` combination.

	**Hints**: the solution is exactly as for point 1, but grouping for both `Area` and `Year`

3. Calculate whether more species are found (on average) when the area is flooded (field `Flooding.binary`), or not.

	**Hints**: you need to group by `"Flooding.binary"` to obtain the result.

4. Produce a count of the co-occurrence of three bird species (Yellowwagtail, YW; Lapwing, LW; Skylark, SK), producing a table like:

	```
	   YW  LW  SK  Occurrences
	    0	0	0	58
	    0	0	1	18
	    0	1	0	24
	    0	1	1	15
	    1	0	0	80
	    1	0	1	59
	    1	1	0	75
	    1	1	1	204
	```

	**Hints**:

	- you need to define new fields, specifying whether a species is present or absent. A simple way to do this is to test for the field to be greater than 0. 

	**Pseudocode**:
	```sql
	/* This query */

	SELECT (Lapwing > 0) AS LW, COUNT(*) AS Occurrences FROM tbirds GROUP BY LW;

	/* Returns

	LW          Occurrences
	----------  -----------
	0           215        
	1           318        
	*/
	```

