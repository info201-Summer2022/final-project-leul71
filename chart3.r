#load packages
library("dplyr")
library("ggplot2")
library("plotly")

#load in csv file
body_percentages <- read.csv("https://raw.githubusercontent.com/the-pudding/data/master/dress-codes/body_percentages.csv", stringsAsFactors = FALSE)

plot_ly(data = body_percentages, labels = ~item, values = ~n, type = "pie",
        textinfo = "label+percent",
        insidetextorientation = "radial")  %>% layout(title = 'Percentages of Clothes Banned According to Body Part')

