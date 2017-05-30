s2003 <- read.table("../data/Smith2003_data.txt", sep = "\t",
                    stringsAsFactors = FALSE)
s2003[s2003 == -999] <- NA
colnames(s2003) <- c("Continent", "Status",
                     "Order", "Family", "Genus",
                     "Species", "LogMass",
                     "CombinedMass", "Reference")
