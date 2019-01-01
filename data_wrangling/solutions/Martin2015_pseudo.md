## Hints and pseudo code for Exercise 9.8.1 (Martin, 2015)

1. Martin (2015) studied songbirds in temperate and tropical environments. He showed (Figure 2A) that peak growth rate is higher in species suffering higher nest predation risk, and is lower in tropical species with the same level of risk as temperate species. In the same Figure (2B) he reported that   nestling period covaries with growth rate, with tropical species having a shorter nestling periods (for the same growth rate) than temperate species. The file `Martin2015_figure2.pdf` contains a figure generated with `ggplot2` similar to Figure 2 of the original paper. Reproduce the figure using the file `Martin2015_data.csv` deposited in the `CSB/ggplot2/data` folder.

**Hints**: 

- the file is `Tab` separated; you can use the `read_tsv` function to read the data
- to arrange multiple plots on the same page, look at the function `grid.arrange` of the package `gridExtra`
- in the data `site` is coded as `1`, `2`, and `3` for `Arizona - temperate`, `Venezuela - tropical`, and `Malaysia - tropical`, respectively. To display the labels you can use the function `factor`, for example

```r
m2015$site <- factor(m2015$site, levels = c(1,2,3), 
                     labels = c("Arizona - temperate",  
                                "Venezuela - tropical", 
                                "Malaysia - tropical"))
```
