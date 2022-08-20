library(dplyr)
library(tidyverse)
clothes_restrictions_df <- read.csv("https://raw.githubusercontent.com/the-pudding/data/master/dress-codes/length_restrictions.csv", stringsAsFactors = FALSE)

#Which type of clothing has the most restrictions in clothes?
#Percentages of schools that ban certain clothing items
#Percentage of body parts that are banned from being visible
# are uniforms better options in schools than regular clothing ?

# This gives us limits on dresses and what restricions are possed.
min_dresses <- clothes_restrictions_df %>% 
  select(School.Name, limits, length) %>% 
  filter(limits == "dresses")

# This gives us the limits on skirts and what restrictions are possed.
Skirts_Bann <- clothes_restrictions_df %>% 
  select(School.Name, limits, length) %>% 
  filter(limits == "skirts")

# This gives us the limits on shorts and what restrictions are possed.
Short_Bann <- clothes_restrictions_df %>%
  select(School.Name, limits, length) %>%
  filter(limits == "shorts")

# This displays how much shorts are banned 
School_bann <- clothes_restrictions_df %>% 
  select(School.Name, limits, length) %>%
  filter(limits == "shorts") %>% 
  nrow()

# This displays how much pants are banned 
pant_bann <- clothes_restrictions_df %>% 
  select(School.Name, limits, length) %>%
  filter(limits == "pants") %>% 
  nrow()








