library(ggplot2)
library(data.table)
library(reshape2)
library(dplyr)


load("suicides.rdata")

suicides$age <- as.factor(suicides$age)

all_suicides <- copy(suicides)
suicides <- suicides %>% 
  group_by(year, age, sex) %>% 
  mutate(deaths = sum(deaths))

#  Make a line plot of suicides by age
# (year on the x axis, deaths on the y axis, different line for each age).
# facet by sex.
# basics
bare <- ggplot(suicides)

#adding plot aesthetics
aesthetic <- ggplot(suicides, aes(x=year, y=deaths))

#adding points
scatter <- ggplot(suicides, aes(x=year, y= deaths)) + geom_point()

#split means by color
color.by.means <- ggplot(suicides, aes(x = year, y = deaths, color = means)) +
  geom_point()

#facet by state
state.fact <- ggplot(suicides, aes(x = year, y = deaths, color = means)) + geom_point() + 
  facet_wrap(~state, scales = "free")

state_fact <- ggplot(suicides, aes(x = year, y = deaths, color = means)) +
  geom_bar(aes(fill = means), stat = "identity") + facet_wrap(~state, scales = "free")

##extra credit####


one_state <- all_suicides[all_suicides$state=="Uttar Pradesh"] %>% 
  group_by(year, state, sex, age, means) %>% 
  mutate(deaths = sum(deaths))

# Make a set of density plots faceted by sex and means of suicide,
# showing distributions of suicides by age, for the state of Uttar Pradesh.
# Label appropriately.




