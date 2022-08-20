library(shinythemes)
source("app_server.R")
clothing_limits <- read.csv("https://raw.githubusercontent.com/the-pudding/data/master/dress-codes/length_restrictions.csv", stringsAsFactors = FALSE)
banned_clothes <- read.csv("https://raw.githubusercontent.com/the-pudding/data/master/dress-codes/clothes_percentages.csv", stringsAsFactors =  FALSE)
body_percentages <- read.csv("https://raw.githubusercontent.com/the-pudding/data/master/dress-codes/body_percentages.csv", stringsAsFactors = FALSE)
first_page <- tabPanel(
  h4("FirstPage"),
  h1("Dress Code"),
  p("Introduction
A dress code's main duty is to advise students and parents on what to wear to school and at any school-related events."),
  p("Additionally, the requirement to adhere to the dress code is an important way for students to learn a skill that is tied to apparel and necessary for success in finding and keeping employment. In this project we will dive deep and analyze how much restrictions there are on clothing in school and see if uniforms are better options for students students."),
  img(src = "https://blog.pearsoninternationalschools.com/wp-content/uploads/2021/11/AL1517034_1800x900-1132x670.jpg")
)

second_page <- tabPanel(
  h4("SecondPage"),
  h1("Chart"),
  p("The chart below represents number of clothing length limits in Each State. The limits bar on the left is a guide on how to understand the chart."),
  p("The yellow represents a really low quality and the red represents a high quality."),
  sidebarLayout(
    sidebarPanel(
      selectInput(
        inputId = "color_input",
        label = "Choose a color for the graph" ,
        choices = c("Red", "Blue", "Orange", "Green", "Black", "White", "Purple", "Brown")
      )
    ),
    mainPanel(
      plotlyOutput(outputId = "graph")
    )
  )
)


third_page <- tabPanel(
  h4("ThirdPage"),
  sidebarLayout(
    sidebarPanel(
      selectInput(
        inputId = "Clothing",
        label = "Choose Clothing",
        choices = unique(banned_clothes$slug),
        
        selected = "pajamas",
        multiple = TRUE),
      selectInput(
        inputId = "color_input_two",
        label = "Choose a color for the graph" ,
        choices = c("Red", "Blue", "Orange", "Green", "Black", "White", "Purple", "Brown")
      )
    ),
    mainPanel(
      plotlyOutput(outputId = "second_graph")
    )
  )
)


Conclusion_Page <- tabPanel(
  h4("Conclusion"),
  p("This is the conclusion Page"),
  p("Takeaways, When doing this project I learned a lot. Few takeaways from this 
    project include knowing which parts of the US are more strict when it comes down to clothing and school regulations."),
  p("Second take away was that I know how many schools ban certain clothing items from students wearing them. Last but not least, the takeaway I had was that clothes 
    that are banned in one state are mostly banned in other states too."),
  p("When this ban is placed there are a lot of factors that play a role.From this data 
  analysis we can conclude that there are restrictions on clothes all around the state.
  So uniforms might be a better alternative because School uniforms may deter crime and 
  increase student safety. Students are kept from becoming distracted by their clothing 
  by wearing uniforms to school. When all of the students are dressed the same, they are 
  less concerned with how they appear and how they fit in with their peers; as a result, 
  they can focus on their academic work.
    By leveling the playing field for all kids, school uniforms prevent bullying and peer pressure."),
  p("When all students wear the same clothes, competition over fashion choices and jeering of those 
  wearing less expensive or up-to-date attire can be minimized.The wearing of uniforms fosters community spirit, unity, and school pride. School uniforms might enhance behavior and attendance. For all the reasons listed above uniforms might be a better alternative for schools so students 
    don't have to worry how they dress and if they meet the guidelines and simply focus on their education."),
  img(src = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSTf_QmT1mwf8Q-FJMJKHEufrXCTBjkch1uFg&usqp=CAU")
)

fourth_page <- tabPanel(
  h4("FourthPage"),
  sidebarLayout(
    sidebarPanel(
      selectInput(
        inputId = "Body",
        label = "Choose Body Type",
        choices = unique(body_percentages$item),
        
        selected = "back",
        multiple = TRUE),
    ),
    mainPanel(
      plotlyOutput(outputId = "pie_chart")
    )
  )
)




ui <- navbarPage(
  tags$title("Shiny"),
  includeCSS("style.css"),
theme = shinytheme("united"),
  first_page,
  second_page,
  third_page,
  fourth_page,
  Conclusion_Page
)