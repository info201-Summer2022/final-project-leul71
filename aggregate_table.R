# load necessary library: dplyr, ggplot2
library(dplyr)
library(ggplot2)

aggregate_table <- {
  top_banned_slugs <- read.csv("https://raw.githubusercontent.com/the-pudding/data/master/dress-codes/clothes_percentages.csv", stringsAsFactors =  FALSE) # read data
  tb1<- top_banned_slugs %>% group_by(slug) %>% # group by each item
    select(slug, n, market) %>% # extract variable slug, n and market from dataframe
    as.data.frame() %>%
    arrange(desc(n)) %>% # order numbers from greatest to lowest.
    slice_max(n, n=10) # display only top 10 clothes banned from the dataframe
  df <- data.frame(tb1) # make it to a dataframe
}

aggregate_table <- rename(aggregate_table, clothing_item = slug)
aggregate_table <- rename(aggregate_table, number_schools = n)
aggregate_table <- rename(aggregate_table, gender = market)

