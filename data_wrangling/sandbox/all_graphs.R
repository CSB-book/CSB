# This file contains all the commands you find in the Chapter
# To see the plots, press CTRL+Return/Enter for each line

# load the library
library(ggplot2)

# read the data
dd <- read.csv("../data/Aakala2015_data.csv", sep = "\t")
# check dimensions
dim(dd)
# show first few lines
head(dd)

# this will return no plot, as we have no layers
ggplot(data = dd, aes(x = dbh))

# simple histograms of diameter at breast height
ggplot(data = dd, aes(x = dbh)) + geom_histogram()
ggplot(data = dd, aes(x = dbh)) + geom_histogram(binwidth = 20)
ggplot(data = dd, aes(x = dbh, fill = species)) + geom_histogram(binwidth = 20) 

# density plots
ggplot(data = dd, aes(x = dbh, fill = species)) + geom_density() 
ggplot(data = dd, aes(x = dbh, fill = species)) + geom_density(alpha = 0.2) 

# dot plot
ggplot(data = dd, aes(x = dbh, fill = species)) + geom_dotplot(alpha = 0.2, binwidth = 10)

# example of faceting
ggplot(data = dd, aes(x = dbh, fill = species)) + geom_histogram(binwidth = 20) + facet_wrap(~species)

# boxplot
ggplot(data = dd, aes(x = species, y = dbh, fill = species)) + geom_boxplot()

# violin plot
ggplot(data = dd, aes(x = species, y = dbh, fill = species, colour = species)) +  geom_violin()

# scatter plot
ggplot(data = dd, aes(x = dbh, y = height)) + geom_point()

# smoothers and regressions
ggplot(data = dd, aes(x = dbh, y = height)) + geom_point() + geom_smooth()
ggplot(data = dd, aes(x = dbh, y = height)) + geom_point() + geom_smooth(method = "lm")
ggplot(data = dd, aes(x = dbh, y = height)) + geom_point() + geom_smooth(method = "glm", formula = "y ~ poly(x, 2)")
ggplot(data = dd, aes(x = dbh, y = height)) + geom_point() + geom_smooth(method = "glm", formula = "y ~ poly(x, 3)")

# one smoother per species
ggplot(data = dd, aes(x = dbh, y = height, colour = species)) + geom_point()
ggplot(data = dd, aes(x = dbh, y = height, colour = species)) + geom_point() + geom_smooth(method = "glm", formula = "y ~ poly(x, 3)")

# location of trees in sites
ggplot(data = dd, aes(x = x, y = y)) + geom_point() + facet_wrap(~site) 
ggplot(data = dd, aes(x = x, y = y, size = crown_area)) + geom_point() + facet_wrap(~site)
ggplot(data = dd, aes(x = x, y = y, size = crown_area, colour = species)) + geom_point() + facet_wrap(~site)
ggplot(data = dd, aes(x = x, y = y, size = crown_area, colour = species, shape = species)) + geom_point() + facet_wrap(~site)  

# 2D density plots
dd2 <- dd[dd$site == 39,]
ggplot(data = dd2, aes(x = x, y = y, z = 1)) + geom_bin2d()
ggplot(data = dd2, aes(x = x, y = y, z = 1)) + geom_bin2d(binwidth = c(4, 4))
ggplot(data = dd2, aes(x = x, y = y, z = 1)) + geom_density2d()
ggplot(data = dd2, aes(x = x, y = y, z = 1)) + geom_bin2d(binwidth = c(4, 4)) + geom_density2d(colour = "red")
ggplot(data = dd2, aes(x = x, y = y, z = 1)) + geom_hex(binwidth = c(4,4))  # requires installing some packages

# barplots
ggplot(data = dd, aes(x = species)) + geom_bar()
ggplot(data = dd, aes(x = species)) + geom_bar() + coord_flip()
ggplot(data = dd, aes(x = as.factor(site), fill = species)) + geom_bar() + coord_flip()
ggplot(data = dd, aes(x = as.factor(site), fill = species)) + geom_bar(position = "dodge") + coord_flip()

# scale_y
ggplot(data = dd, aes(x = height, y = crown_area)) + geom_point()
ggplot(data = dd, aes(x = height, y = crown_area)) + geom_point() + scale_y_log10()
ggplot(data = dd, aes(x = height, y = crown_area)) + geom_point() + scale_y_sqrt()

# scale_color
ggplot(data = dd, aes(x = height, y = crown_area, colour = dbh)) + geom_point() 
ggplot(data = dd, aes(x = height, y = crown_area, colour = dbh)) + geom_point() + scale_color_gradient(high = "black", low = "red")

# playing with colors
pl <- ggplot(data = dd, aes(x = height, y = crown_area, colour = species)) + geom_point()
pl + scale_color_brewer(palette = "Accent")
pl + scale_color_brewer(palette = "Set1")
pl + scale_color_brewer(palette = "Pastel")
pl + scale_color_manual(values = c("red", "darkgreen", "yellow", "pink"))

# scale_size
pl <- ggplot(data = dd, aes(x = height, y = crown_area, colour = species, size = dbh)) + geom_point()
pl + scale_size(breaks = c(1,10,100,250,500))

# scale_shape
pl <- ggplot(data = dd, aes(x = height, y = crown_area, shape = species)) + geom_point()
pl + scale_shape(solid = FALSE)
pl + scale_shape(solid = FALSE, name = "Latin binomial")
pl + scale_shape_manual(values = c(1,16,6,9))

# faceting
dd3 <- dd[dd$site < 5,]
pl <- ggplot(data = dd3, aes(x = x, y = y)) + geom_point()
pl + facet_grid(species~site)
pl + facet_wrap(~site)

# labels
pl <- ggplot(data = dd3, aes(x = x, y = y)) + geom_point() + facet_grid(species~site)
pl + xlab("x coordinate (in m)")
pl + ylab("y coordinate (in m)") 
pl + ggtitle("A new title for the graph")

# themes
pl <- ggplot(data = dd, aes(x = as.factor(site), fill = species)) + geom_bar(position = "dodge") + coord_flip() 
pl + theme_grey() # default theme with grey background and white gridlines
pl + theme_bw() # white background and black gridlines
pl + theme_classic() # no gridlines
pl + theme_minimal() # clean theme

# saving to file
ggsave(filename = "test.pdf", plot = pl, width = 3, height = 4)

# setting a feature
ggplot(data = dd, aes(x = dbh, y = height)) + geom_point()
ggplot(data = dd, aes(x = dbh, y = height)) + geom_point(alpha = 0.1)
ggplot(data = dd, aes(x = dbh, y = height)) + geom_point(color = "darkred")
ggplot(data = dd, aes(x = dbh, y = height)) + geom_point(shape = 3, size = 4)

# switching legends off
pl <- ggplot(data = dd, aes(x = dbh, y = height, shape = species, color = site, size = crown_area)) + geom_point()
pl
pl + theme(legend.position = "none") # switch off all legends
pl + guides(color = "none", size = "none") # switch off some legends

# zooming into a region
pl + coord_cartesian(xlim = c(0,200), ylim = c(5, 10))
