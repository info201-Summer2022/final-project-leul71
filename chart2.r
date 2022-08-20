#load in packages
library(ggplot2)
library(dplyr)
library(forcats)

#load csv file
banned_clothes <- read.csv("https://raw.githubusercontent.com/the-pudding/data/master/dress-codes/clothes_percentages.csv", stringsAsFactors =  FALSE)

#create chart
banned_clothes %>%
 ggplot(aes(x=slug, y = n)) +
   geom_bar(stat="identity", fill="red", alpha=.6, width=.4) +
   labs(title = "Amount of schools that ban a piece of clothing",
       y = "Number of schools that ban clothing piece",
       x = "Clothing item") +
  coord_flip() +
  xlab("") +
  theme_bw()

