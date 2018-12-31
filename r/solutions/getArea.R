## The function getArea accepts the full file name of a .JPG image,
## and processes the image to return the projected leaf area of
## green plants on a light background

getArea <- function(f) {
    i <- normalize(readImage(paste("../data/leafarea/", f, sep="")))
    i <- i + 0.05 # adjust brighness
    # extract the three RGB channels
    dr <- as.vector(i[,, 1])
    dg <- as.vector(i[,, 2])
    db <- as.vector(i[,, 3])
    # d is the vector of all pixels in the image
    # adjust the channels to enhance green and reduce red
    d <- dr + 2 * db + dg / 1.5
    # set background (white) to black
    d[d >= 1] <- NA
    # set everything else to white to create a mask
    d[d < 1] <- 1
    d[is.na(d)] <- 0
    d <- matrix(d, nrow = dim(i)[1])
    mask <- Image(d)   
    # erode and dilate to remove small objects
    kern <- makeBrush(size = 1, shape = "disc", step = F)
    mask <- dilate(mask, kern)
    ## find object of less than 250 pixels and delete them
    m <- as.vector(mask[mask != 0])
    X <- table(m)
    todel <- names(X[X < 250])
    if (length(todel) > 0) mask <- rmObjects(mask, as.numeric(todel))
    ## apply gaussian blur to smooth contours
    mask <- gblur(mask, s = 5, r = 7)
    mask[mask >= 0.4] <- 1
    mask[mask < 0.4] <- 0
    # calculate the projected leaf area (the cut-out area of the mask)
    pic.shape <- computeFeatures.shape(mask)
    # uncomment the next lines to display processed images in browser
    # i2 <- i
    # i2[mask == 0] <- 1
    # display(i2)
    return(pic.shape[1])
}
