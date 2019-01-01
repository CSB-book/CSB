## Hints and pseudo code for Exercise 9.8.3 (Urban, 2015)

1. Urban (2015) conducted a meta-analysis of extinction risks and its relationship to climate change. He included 131 studies. In Figure 1, he plotted the number of studies reporting a certain overall proportion of extinction risk. The data (`data/Urban2015_data.csv`) is at a finer resolution than what needed for this figure. In fact, each study has been split into different lines according to the method and taxa used to compute the extinction risk. To reproduce Figure 1, you will need to coarse grain the data by grouping lines with the same author/year, and for each study compute the proportion of species at risk for extinction (sum the `N.Ext` for each study, and divide for the corresponding sum of `Total.N`). A close inspection of the original Figure shows that the data has been plotted in bins of unequal size (e.g., '0.5 < proportion < 1' is in one bin) so you will need to classify the various proportions into appropriate bins (0, 0-0.05, 0.05-0.1, ..., 0.5-1) before plotting. A `ggplot2` version of Figure 1 of the original paper is reported in `data/Urban2015_figure1.pdf`. Reproduce the figure.

**Hints**:

- the data are `Tab` separated; use `read_tsv` to read the file
- use `dplyr` and the function `summarise` to find the total number of extinctions (sum of `N.Ext`) and the total number of species (sum of `Total.N`) for each study (group by `Author` and `Year`)
- the original Figure uses unequal bin widths; to reproduce the unequal bin sizes either define them explicitly in the histogram definition, or add a column to the data using the function `findInterval`
