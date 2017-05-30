source("read_mass.R")
# Get unique families, removing NAs
fam_unique <- sort(unique(s2003$Family[is.na(s2003$Family) == FALSE]))
# Empty data frame
families_mass <- data.frame()
# Cycle through families
for (fam in fam_unique) {
  # Get body masses
  fam_logmass <- s2003[(s2003$Family == fam) & 
                         (is.na(s2003$LogMass) == FALSE) & 
                         (is.na(s2003$Family) == FALSE), 
                       "LogMass"]
  # Add to the data.frame if there are masses
  families_mass <- rbind(families_mass, 
                         data.frame(Family = fam, 
                                    AvgMass = mean(exp(fam_logmass)), 
                                    NumSpecies = length(fam_logmass)))
}
# See the results
head(families_mass)
