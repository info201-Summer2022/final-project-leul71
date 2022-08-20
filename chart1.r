#load in packages
library("dplyr")
library("plotly")
library("ggplot2")
library("scales")
library("maps")
library("mapproj")

#load in csv file 
clothing_limits <- read.csv("https://raw.githubusercontent.com/the-pudding/data/master/dress-codes/length_restrictions.csv", stringsAsFactors = FALSE)

#load map shape 
state_shape <- map_data("state")

#create chart
clothing_limits <- clothing_limits %>% 
  mutate(state_fullname = tolower(state.name[match(School.State.Abbreviation, state.abb)]))

state_data <- clothing_limits %>% 
  group_by(state_fullname) %>% 
  summarize(num_limits = n())

state_shape_data <- left_join(state_shape, state_data,
                              by = c("region" = "state_fullname"))

ggplot(state_shape_data) + 
  geom_polygon(mapping = aes(x=long,y=lat,group=group,fill=num_limits)) +
  scale_fill_continuous(low = 'yellow', high = 'red', labels = label_number_si()) +
  coord_map() +
  labs(title = 'Number of Clothing Length Limits in Each State', fill='Limits')
