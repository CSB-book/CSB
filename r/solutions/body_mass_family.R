source("read_mass.R")
# Empty dataframe with three columns
families_mass <- data.frame(Family = character(0),
                            AvgMass = numeric(0),
                            NumSpecies = numeric(0))

for (sp in 1:dim(s2003)[1]) {
  # Extract family and mass
  my_fam <- s2003[sp,]$Family
  my_mass <- exp(s2003[sp,]$LogMass)
  # If both are available
  if ((is.na(my_fam) == FALSE) & (is.na(my_mass) == FALSE)) {
    # Check whether the family is already in the data.frame
    # if so, return the index
    fam_num <- which(families_mass$Family == my_fam)
    # The function which returns integer(0) if no match is found
    # We can test wheter a match was found by checking the length of 
    # fam_num
    if (length(fam_num) == 1) {
      # Add the mass
      families_mass[fam_num,"AvgMass"] <- families_mass[fam_num,"AvgMass"] + my_mass
      # Add to number of species 
      families_mass[fam_num,"NumSpecies"] <- families_mass[fam_num,"NumSpecies"] + 1
    } else {
      # Add the family to the data.frame
      families_mass <- rbind(families_mass,
                             data.frame(Family = my_fam, 
                                        AvgMass = my_mass, 
                                        NumSpecies = 1))
    }
  }
}

# Now divide AvgMass by NumSpecies
families_mass$AvgMass <- families_mass$AvgMass / families_mass$NumSpecies
# And reorder the data for readability
families_mass <- families_mass[order(families_mass$Family), ]
# See the first few records
head(families_mass)
