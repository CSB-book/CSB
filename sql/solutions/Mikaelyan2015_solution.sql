/* Solution of 10.11.2 */
/* Gut microbiome of termites --- Mikaelyan et al. 2015 */
/* You can copy and paste these commands into the SQLite shell */

/*
1) By joining the three tables, create a view displaying
   Spp (species name), OTU (code for the OTU), and Num, 
   the number of occurrences of the OTU in the gut of the
   species. Notice that Num can be (and often is) $0$.
*/

-- First, we write a simple query to join the three tables:
SELECT Spp, OTU, Num
FROM tSpp INNER JOIN tNumber ON tSpp.IDSpp = tNumber.IDSpp
INNER JOIN tOTU on tNumber.IDOTU = tOTU.IDOTU
LIMIT 50;

-- If we're satisfied with the result, we can turn it into a view
CREATE VIEW combined AS
SELECT Spp, OTU, Num
FROM tSpp INNER JOIN tNumber ON tSpp.IDSpp = tNumber.IDSpp
INNER JOIN tOTU on tNumber.IDOTU = tOTU.IDOTU;

/*
2) Count the number of OTUs found in each species (remember to
   filter using Num > 0).
*/

SELECT Spp, count(OTU) AS NumOTU FROM 
combined WHERE Num > 0
GROUP BY Spp ORDER BY NumOTU DESC;

/* 
3) List the OTUs that are found in four or more species
*/

SELECT OTU, count(Spp) AS NumSpp FROM 
combined WHERE Num >0
GROUP BY OTU 
HAVING NumSpp > 3
ORDER BY NumSpp DESC;

/* 
4) Delete all the records in tNumber where Num is zero.
*/

DELETE FROM mytable
WHERE Num = 0;

/*
5) [Advanced] Using the package vegan in R, compute the 
   Shannon's index of diversity for the gut microbial
   community of each species.
*/

-- The solution is reported in the file calculate_Shannon.Rmd

