## Hints and pseudo code for Exercise 8.23.4 (Letchford *et al.*, 2015)

1. Write a program that performs the test described above using all the papers published in 2010. The program should do the following: 1) read the data; 2) extract all the papers published in 2010; 3) rank the articles by citations, and by title length; 4) compute the Kendall's tau expressing the correlation between the two rankings. For this dataset, the Authors got a tau of about -0.07 with a significant p-value.

  **Hints**: 
  
  - the function `rank` can be used to rank values (e.g., title lengths, citations)
  - to perform a correlation test, use `cor.test(x, y, method = "kendall", use = "pairwise")`
  
  **Pseudocode**:
  
  ```r
  # Read the data
  l2015 <- here the code
  # extract the papers in 2010
  p2010 <- subset the data
  # extract citations and title lengths
  cor(citations, titlelength, method = "kendall", use = "pairwise")
  ```

2. Write a function that repeats the analysis for a particular journal-year combination. Try to run the function for the top scientific publications `Nature` and `Science`, and for the top medical journals `The Lancet` and `New Eng J Med`, for all years in the data (2007-2013). Do you always find a negative, significant correlation (i.e., negative tau with low *p*-value)?


**Pseudocode**:

  ```r
  # subset the data using a function
  compute_tau_journal_year <- function(my_data, my_journal, my_year) {
    # subset data
    # store correlation
    # run correlation test
    # store pvalue
    return(data.frame(Journal = my_journal,
                      Year = my_year,
                      tau = my_tau,
                      pvalue = my_pvalue))
  }
  ```
