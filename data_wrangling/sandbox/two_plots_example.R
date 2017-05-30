library(ggplot2)
library(dplyr)
library(tidyr)
library(ggthemes)
library(gridExtra)

###############################
# PLOT 1
###############################
# Build the matrix 
# each element is i.i.d. from a uniform distribution U[-1,1]
S <- 25
M <- matrix(runif(S * S, -1, 1), S, S)

# For plotting, rearrange the rows in inverse order
M <- M[S:1,]

# make into a dataframe using tidyr
# 1) make into dataframe
Mdf <- as.data.frame(M)
# 2) rename columns
colnames(Mdf) <- 1:S
# 3) add a key called "Row"
Mdf$Row <- 1:S
# 4) use gather to make into a long data frame
Mdf <- gather(Mdf, Row)
# 5) rename columns for clarity
colnames(Mdf) <- c("Row", "Column", "Value")

# Create first plot
pl <- ggplot(data = Mdf, aes(x = Row, y = Column, fill = Value)) + geom_tile()
# change color scheme
pl <- pl + scale_fill_gradient2()
# remove background and legend
pl <- pl + theme_map() + theme(legend.position = "none")
# add title
pl <- pl + ggtitle("a) Random matrix with uniform coefficients")
# change title font etc.
pl <- pl + theme(plot.title=element_text(family = "Times", face = "bold", size = 14))
# make sure coordinates are equal
pl <- pl + coord_equal()
print(pl)

###############################
# PLOT 2
###############################
# Create a larger matrix and calculate eigenvalues
S <- 500
M <- matrix(runif(S * S, -1, 1), S, S)
ev <- eigen(M, only.values = TRUE)$values
# Create data frame for eigenvalues
Edf <- data.frame(Real = Re(ev), Imaginary = Im(ev))

# Plot eigenvalues
pl2 <- ggplot(data = Edf, aes(x = Real, y = Imaginary)) + geom_point(shape = 3)
# change theme
pl2 <- pl2 + theme_bw()

# Function to create data frame for circle
build_circle_df <- function(radius){
    thetas <- seq(pi / 2.0, 0.0, length = 500)
    xbase <- radius * cos(thetas)
    ybase <- radius * sin(thetas)
    x <- c(xbase, rev(xbase), -xbase, rev(-xbase))
    y <- c(ybase, rev(-ybase), -ybase, rev(ybase))
    return(data.frame(Real = x , Imaginary = y))
}

# compute variance
my_var <- mean(M^2) - mean(M)^2
# create data frame for circle
circledf <- build_circle_df(sqrt(S * my_var))
# add to the plot
pl2 <- pl2 + geom_polygon(data = circledf, aes(x = Real, y = Imaginary), fill = NA, colour = "lightblue")
pl2 <- pl2 + ggtitle("b) The eigenvalues are approximately uniform in a circle")
pl2 <- pl2 + theme(plot.title=element_text(family = "Times", face = "bold", size = 14))
# make sure coordinates are equal
pl2 <- pl2 + coord_equal()
print(pl2)

###############################
# COMBINE PLOTS
###############################
# combine the two plots using gridExtra
print(grid.arrange(pl, pl2, ncol = 2))
