/* Solution of 10.11.1 */
/* Species richness of birds in wetlands --- Zmihorski et al. 2015 */
/* You can copy and paste these commands into the SQLite shell */

/* 
1) Each Area contains several sites (PointID). Calculate the average
   Species.richness for each site.
*/

-- We need to average Species.richness while grouping by Area:
SELECT Area, avg("Species.richness") AS avg_richness
FROM tbirds
GROUP BY AREA 
ORDER BY AREA;
-- Note that we need to put Species.richness between quotes
-- as SQLite does not like punctuation within field names.


/*
2) Calculate the average Species.richness for each
   Area/Year combination.
*/

-- As the query above, but group also by Year:
SELECT Area, Year, avg("Species.richness") AS avg_richness
FROM tbirds
GROUP BY AREA, Year
ORDER BY AREA, Year;

/*
3) Calculate whether more species are found (on average) when the
   area is flooded (field Flooding.binary), or not.
*/

SELECT "Flooding.binary", avg("Species.richness") AS avg_richness
FROM tbirds
GROUP BY "Flooding.binary";

/* 
4) Produce a count of the co-occurrence of three bird species (Yellowwagtail, YW; 
   Lapwing, LW; Skylark, SK), producing a table like:
 
    YW  LW  SK  Occurrences
    0	0	0	58
    0	0	1	18
    0	1	0	24
    0	1	1	15
    1	0	0	80
    1	0	1	59
    1	1	0	75
    1	1	1	204    

*/    

SELECT (Yellowwagtail > 0) AS YW,
(Lapwing > 0) AS LW,
(Skylark > 0) AS SK,
count(*) AS Occurrences
FROM tbirds
GROUP BY YW, LW, SK;
