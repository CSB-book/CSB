rm(list = ls())
# many related packages 
# for data wrangling and 
# visualization
library(tidyverse) 

#############################
# PART 1: dplyr
#############################

# Read the data and make into tibble
dt <- read_csv("../data/Herrmann2016/ADB_Data.csv")
# by default, a tibble shows only the first few rows
dt
# to see the first few, use head(dt)
head(dt)
# the last few
tail(dt)
# To have an idea of the structure, run glimpse
glimpse(dt)

# how many rows?
nrow(dt)
# how many columns?
ncol(dt)

# select only a few columns
# a) specify name of the columns
select(dt, Site, Band_number)
# b) Match several columns using regex
select(dt, matches(".and.*"))
# c) select all but few
select(dt, -Site)

# select only a few rows
# a) based on values
filter(dt, Site == "BCI")
filter(dt, Site == "BCI", Band_temp > 28)
filter(dt, Site != "BCI")
filter(dt, Site %in% c("BCI", "SCBI"))
# b) select at random
sample_n(dt, 5) # 5 random rows
sample_frac(dt, 0.1) # 1% of the data
# c) specific rows
slice(dt, 1:100) # first 100 rows
slice(dt, 50:60) # between 50 and 60
# d) once ordered by one or more columns
top_n(dt, 15, desc(Band_temp)) # 15 with lowest temperatures
# note: one Band_temp is -273.15 Celsius -> 0 Kelvins! That's absolute zero!!

# Ordering data
arrange(dt, desc(Band_temp), Site)
# note: also very high temperatures! Wood typically ignites at about 250 C...

## PIPELINES
# find distinct Band_number per site
distinct(select(dt, Band_number))
distinct(select(dt, Site, Band_number))
# Make into a pipeline
dt %>% select(Site) %>% distinct()
# To type %>% use Ctrl + Shift + m

## SUMMARIES
# calculate average temperature
dt %>% summarise(avg_tmp = mean(Band_temp, na.rm = TRUE)) 
# calculate number of times temperature > 30 degrees
dt %>% summarise(hot = sum(Band_temp > 30, na.rm = TRUE)) 
# proportion hot 
dt %>% summarise(prop_hot = sum(Band_temp > 30, na.rm = TRUE) / n()) 
# n() is a special function that counts the number of rows

## SUMMARIES BY GROUP
dt %>% group_by(Site) %>% summarise(avg_tmp = mean(Band_temp, na.rm = TRUE),
                                    min_tmp = min(Band_temp, na.rm = TRUE),
                                    median_tmp = median(Band_temp, na.rm = TRUE),
                                    max_tmp = max(Band_temp, na.rm = TRUE))

# examples:
# count number of observations per band
dt %>% group_by(Band_number) %>% summarise(n_obs = n()) %>% arrange(desc(n_obs))
# get only max temp per band
dt %>% group_by(Band_number) %>% summarise(max_tmp = max(Band_temp))
# get the first temperature
dt %>% group_by(Band_number) %>% summarise(first_tmp = first(Band_temp))
# sometimes you want to get rid of the grouping information
# see the difference between
dt %>% group_by(Site, Band_number) %>% summarise(avg_tmp = mean(Band_temp, na.rm = TRUE)) %>% 
  summarise(nn = n())
# and
dt %>% group_by(Site, Band_number) %>% summarise(avg_tmp = mean(Band_temp, na.rm = TRUE)) %>% 
  ungroup() %>% summarise(nn = n())

## MUTATING: ADDING A COLUMN THAT IS A FUNCTION OF THOSE IN THE DATA
# we want to calculate the temperature in F
# temp_F = temp_C * 1.8 + 32
dt %>% mutate(Band_temp_F = Band_temp * 1.8 + 32)
# transmute is like mutate, but drop origian col
dt %>% transmute(Band_temp_F = Band_temp * 1.8 + 32)

## CAN MUTATE BY GROUP
# example: add a column with average temp for each band
dt %>% group_by(Band_number) %>% mutate(avg = mean(Band_temp))

## Renaming columns
dt %>% rename(temp = Band_temp)

#############################
# PART 2: ggplot2
#############################
ggplot(dt) # does not plot anything
# take a small sample
dt1 <- dt %>% filter(Site =="BCI") %>% sample_frac(0.05)
# remove crazy temps
dt1 <- dt1 %>% filter(Band_temp < 50, Band_temp > -10)

ggplot(dt1) + geom_point(mapping = aes(x = Time_stamp, y = Band_temp))
ggplot(dt1) + geom_point(mapping = aes(x = Time_stamp, y = Band_temp), alpha = 0.1)
ggplot(dt1, mapping = aes(x = Time_stamp, y = mm, colour = Site, group = Band_number)) + geom_point(alpha = 0.1) + geom_smooth()
