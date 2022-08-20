library("dplyr")
library("plotly")
library("ggplot2")
library("scales")
library("maps")
library("mapproj")
library(plotly)
clothing_limits <- read.csv("https://raw.githubusercontent.com/the-pudding/data/master/dress-codes/length_restrictions.csv", stringsAsFactors = FALSE)
banned_clothes <- read.csv("https://raw.githubusercontent.com/the-pudding/data/master/dress-codes/clothes_percentages.csv", stringsAsFactors =  FALSE)
body_percentages <- read.csv("https://raw.githubusercontent.com/the-pudding/data/master/dress-codes/body_percentages.csv", stringsAsFactors = FALSE)

server <- function(input, output){
  output$graph <- renderPlotly({
    
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
    
   Plot <-  ggplot(state_shape_data) + 
      geom_polygon(mapping = aes(x=long,y=lat,group=group,fill=num_limits), color = input$color_input) +
      scale_fill_continuous(low = 'yellow', high = 'red', labels = label_number_si()) +
      coord_map() +
      labs(title = 'Number of Clothing Length Limits in Each State', fill='Limits')
   
   return(Plot)
  })
  
  output$second_graph <- renderPlotly({
    
    Filter_Data <- banned_clothes %>% 
      filter(slug %in% input$Clothing)
    
   Overall <-  Filter_Data %>%
      ggplot(aes(x=slug, y = n)) +
      geom_bar(stat="identity", fill="red", alpha=.6, width=.4, color = input$color_input_two) +
      labs(title = "Amount of schools that ban a piece of clothing",
           y = "Number of schools that ban clothing piece",
           x = "Clothing item") +
      coord_flip() +
      xlab("") +
      theme_bw()
    
    
    return(Overall)
  })
  output$pie_chart <- renderPlotly({
    Data <- body_percentages %>% 
      filter(item %in% input$Body)
 Pie_Chart <-  plot_ly(data = Data, labels = ~item, values = ~n, type = "pie",
          textinfo = "label+percent",
          insidetextorientation = "radial")  %>% layout(title = 'Percentages of Clothes Banned According to Body Part')
 
 return(Pie_Chart)
  })
}

