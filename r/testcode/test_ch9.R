rm(list = ls())
## why tidyverse
library(tidyverse)

## reading files (what does this do, read_delim)
ants <- read_csv("../data/Mersch2013/behavior.csv")
# read_csv2 for ;
# read_tsv for Tab
# read_fwf for fixed length
# read_delim for arbitrary delimiter

# The tibble format
ants
head(ants, 3)
tail(ants, 3)
glimpse(ants)
View(ants)

# selecting rows --- filter
filter(ants, colony == 4)
# multiple filters
filter(ants, colony == 4, age > 30)
# using logical operators
filter(ants, colony == 4, age < 30 | age > 100)
filter(ants, colony == 4, age > 100, group_period1 == "F")
# using %in% 
filter(ants, colony == 4, group_period1 %in% c("F", "Q"))

# partial data
sample_frac(ants, 0.01)
sample_n(ants, 5)
slice(ants, 5:10)
top_n(ants, 5, body_size)
top_n(ants, -5, body_size)

# select
select(ants, colony, age)
select(ants, colony, contains("group"))
select(ants, colony, starts_with("visit"))
# mentions ends with
select(ants, num_range("group_period", 1:2))
select(ants, matches("*.\\d")) # any regular expression
select(ants, -colony, -age)

# distinct columns
distinct(select(ants, colony))
distinct(select(ants, colony, group_period1))

# Pipes
ants %>% select(colony) %>% distinct()

# arrange
ants %>% select(colony) %>% distinct() %>% arrange(colony)
ants %>% select(colony) %>% distinct() %>% arrange(desc(colony))

# mutate & transmute
ants %>% select(colony, age) %>% mutate(age_yrs = age / 365.25)
ants %>% select(colony, age) %>% transmute(age_yrs = age / 365.25)
# rename
ants %>% select(colony, age, body_size) %>% rename(bsize = body_size)

# counting
ants %>% count()
# summarize
ants %>% summarise(avg_bs = mean(body_size), 
                   sd_bs = sd(body_size), 
                   cor_age_bs = cor(age, body_size))

# grouping!
ants %>% group_by(age) %>% 
  summarise(avg_bs = mean(body_size))

ants %>% group_by(colony, group_period1) %>% 
  summarise(number = n(), avg_bs = mean(body_size)) %>% 
  arrange(colony, avg_bs)
ants %>% group_by(group_period1) %>% summarise(max_bs = max(body_size))

# mention ungroup

# Intermezzo 1
# calculate average body size per colony
ants %>% group_by(colony) %>% 
  summarise(avg_bs = mean(body_size))
# Queens can live up to 26 years: how old were the Queens in this experiment?
ants %>% filter(group_period1 == "Q") %>% select(colony, age, group_period1)
# How old is the oldest forager? (use group_period1 == "F")
ants %>% filter(group_period1 == "F") %>% select(colony, age, group_period1) %>% arrange(desc(age)) %>% head(1)
# Find the oldest individual per role (F, C, N, Q) --- there's an error in the data! One ant lived for 107 years...
ants %>% group_by(group_period1) %>% summarise(agemax = max(age))

# Plotting
# ggplot idea: write a well-formed sentence --- a grammar of graphics
ggplot(data = ants) # data
ggplot(data = ants) + aes(x = age, y = body_size) # aesthetic mapping
ggplot(data = ants) + aes(x = age, y = body_size) + geom_point() # geometry
# remove the ant who lived for 107 years...
ggplot(data = ants %>% filter(age < 2000)) + aes(x = age, y = body_size) + geom_point() # geometry
# add a smooth
ggplot(data = ants %>% filter(age < 2000)) + aes(x = age, y = body_size) + geom_point() + geom_smooth()
# exclude queens
ggplot(data = ants %>% filter(age < 2000, group_period1 != "Q")) + aes(x = age, y = body_size) + geom_point() + geom_smooth()
# by group
ggplot(data = ants %>% filter(age < 2000, group_period1 != "Q")) + aes(x = age, y = body_size, colour = group_period1) + geom_point() + geom_smooth()

# one variable
pl <- ggplot(data = ants %>% filter(age < 2000, group_period1 != "Q")) 
pl + geom_histogram(aes(body_size), bins = 40) # histogram
pl + geom_density(aes(body_size))
pl + geom_bar(aes(group_period1))

pl + geom_boxplot(aes(x = group_period1, y = age))
pl + geom_violin(aes(x = group_period1, y = age))

# Scales
pl <- ggplot(data = ants %>% filter(age < 2000), aes(x = age, y = body_size, colour = group_period1)) + geom_point()
pl + scale_colour_brewer(palette = "Set1")
pl + scale_colour_manual(values = c("yellow", "red", "green", "blue"))
pl + scale_x_log10("age in days") + scale_y_sqrt("body size (in pixels, 0.06 mm)")

pl <- ggplot(data = ants %>% filter(age < 2000), aes(x = age, y = body_size, colour = log(age))) + geom_point() + scale_x_log10()
pl + scale_color_gradient2(low = "black", mid = "green", high = "red")
pl + aes(shape = group_period1, size = body_size)

# facets
pl <- ggplot(data = ants, aes(x = body_size, colour = group_period1, fill = group_period1)) + geom_histogram(alpha = 0.1, position = position_dodge())
pl + facet_grid(~colony)
pl + facet_grid(colony~.)
pl + facet_grid(colony~group_period1)

# themes
pl <- ggplot(data = ants %>% filter(age < 2000), aes(x = age, y = body_size, colour = group_period1)) + geom_point()
pl + theme_bw()
pl + theme_dark()
pl + theme_minimal()
pl + theme_bw() + theme(legend.position = "bottom")
pl + theme_bw() + theme(legend.position = "none") + 
  xlab("description x axis") + ggtitle("my main title")
# working with legends
pl <- ggplot(data = ants %>% filter(age < 2000), 
             aes(x = age, y = body_size, 
                 colour = group_period1,
                 shape = group_period1,
                 size = body_size)) + 
  geom_point() + 
  facet_wrap(~group_period1, scales = "free")
show(pl)
pl + guides(colour = "none")
pl + scale_size_continuous("my legend", breaks = c(100, 200, 300))
pl + scale_shape_discrete("my shapes", solid = FALSE)

# Setting a value
ggplot(data = ants, aes(x = factor(colony))) + geom_bar(colour = "red", fill = "darkblue")
ggplot(data = ants, aes(x = group_period1, y = body_size, colour = group_period1)) + geom_jitter(alpha = 0.5)

# stats
ggplot(data = ants %>% filter(age < 2000), aes(x = age, y = body_size)) + stat_bin2d()
ggplot(data = ants %>% filter(age < 2000), aes(x = age, y = body_size)) + stat_density2d()
ggplot(data = ants %>% filter(age < 2000), aes(x = age, y = body_size)) + geom_point() + stat_ellipse(level = 0.75, colour = "red")

ggplot(data = ants %>% filter(age < 2000), aes(x = age)) + stat_ecdf()

pl <- ggplot(data = ants %>% filter(age < 2000), aes(x = age, y = body_size)) + geom_point()
pl + stat_summary(fun.y = "median", geom = "point", colour = "red", shape = 3)
ggplot(data = ants, aes(x = group_period1, y = body_size, colour = group_period1)) + 
  geom_jitter(alpha = 0.5) + stat_summary(fun.data = "mean_cl_normal", colour = "black")

# adding multiple geoms
pl <- ggplot(data = ants %>% filter(age < 2000), aes(x = age, y = body_size)) + geom_point()
pl + geom_abline(intercept = 0, slope = 2, linetype = 2, colour = "red") + geom_vline(xintercept = 500, linetype = 3)

# Saving
ggsave(pl, file = "test.png", width = 5, height = 7)

## Intermezzo
# boxplot of foragining events by group_period1; set scale y in log10
ggplot(ants, aes(x = group_period1, y = foraging_events)) + geom_boxplot() + scale_y_log10()

# Tidying data
# visits to brood, entrance and rubbishpile --- geom_tile
# gather: from cols to rows
visits <- ants %>% group_by(group_period1, colony) %>% 
  summarise(rubbish = mean(visits_rubbishpile), 
            brood = mean(visits_brood), 
            entrance = mean(visits_entrance)) 
visits <- visits %>% gather(location, average_visits, 3:5)
ggplot(data = visits, aes(x = group_period1, y = location, fill = group_period1, alpha = sqrt(average_visits))) + geom_tile() + facet_wrap(~colony)
# spread: from row to cols
foraging_by_colony <- ants %>% group_by(colony, group_period1) %>% summarise(avg_foraging = mean(foraging_events))
foraging_by_colony <- foraging_by_colony %>% spread(group_period1, avg_foraging)

## moving between groups
roles <- ants %>% select(group_period1, group_period2) %>% 
  rename(p1 = group_period1, p2 = group_period2)
# add a counter
roles <- roles %>% mutate(count = 1) %>% group_by(p1, p2) %>% summarise(transitions = sum(count))
# remove nas
roles <- roles %>% filter(!is.na(p2))
# we want to have probabilities: sum by p1
roles <- roles %>% group_by(p1) %>% mutate(tottrans = sum(transitions)) %>% mutate(prob = transitions / tottrans)
ggplot(data = roles, aes(x = p1, y = p2, fill = prob)) + geom_tile()
# table for paper
roles %>% select(p1, p2, prob) %>% spread(p2, prob, fill = 0)

# Joining data
# inner_join


