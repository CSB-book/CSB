## Hints and pseudo code for Exercise 9.8.2 (Bolstad *et al.*, 2015)

1. Boldstad et al. (2015) studied the allometric relationships between the length of the wings of Drosophilidae and the length of the L2 vein that runs across the wing. They measured more than 20,000 individuals, belonging to 111 species. In their Figure 1, they show regressions between the log length of the wing size and the log length of the L2 vein. They produce a regression for each species and sex. They then added points showing the average values for each species. The file `data/Bolstad2015_figure1.pdf` contains a simplified version of Figure 1 of the original paper. Reproduce the figure. The data is stored in `CSB/ggplot2/data/Boldstad2015_data.csv`. The logarithm of wing size and L2 length is already taken.

**Hints**:

- you want to produce a separate regression for each `Species`, and facet by `Sex`. We could use the aesthetic mapping `colour` to separate the species, but that would produce too many different colors. Alternatively, we can define the `group` directly in the aesthetic mapping: `aes(x = WingSize, y = L2Length, group = Species)`, defining the groups that will be used for the regressions.
- to add the summary for each `Species` and `Sex`, you can create another `tibble` using `dplyr` and the function `summarise`. You can then overlay these data on the original graph by using `pl + geom_point(data = your new tibble)`.
