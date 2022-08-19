library(ggplot2)
library(dplyr)
library(tidyr)
library(stringr)
library(maps)
library(mapproj)
library(plotly)
soccer_df <- read.csv("https://raw.githubusercontent.com/tara-nguyen/english-premier-league-datasets-for-10-seasons/main/epldat10seasons/epl-allseasons-matchstats.csv")

# Does playing at home or away make a difference in your team's performance ?

# stats of Chelsea 
Chelsea_home_stat <- soccer_df %>% 
  select(HomeTeam, HomeGoals,Date, Season, HomeShots, HomeShotsOnTarget, HomeCorners,
         HomeFouls, HomeYellowCards, HomeRedCards) %>% 
  filter(HomeTeam == "Chelsea")

Chelsea_home_stat$Season <- substr(Chelsea_home_stat$Season, 1, 4)

  
chelsea_data <- Chelsea_home_stat %>% 
  group_by(Season) %>% 
  summarise(
    HomeTeam = HomeTeam, HomeGoals = sum(HomeGoals),
    Season = as.integer(Season), HomeShots = sum(HomeShots), 
    HomeShotsOnTarget = sum(HomeShotsOnTarget), 
    HomeCorners = sum(HomeCorners),
    HomeFouls = sum(HomeFouls), 
    HomeYellowCards = sum(HomeYellowCards), 
    HomeRedCards = sum(HomeRedCards),
    .groups = "drop"
  )

Gather_Data <- gather(chelsea_data, key = Measure, value = Leul)
colors = c("red", "black", "orange", "blue", "purple", "green", "yellow")
Start_Creating  <- ggplot(data = chelsea_data)  +
  geom_line(mapping = aes(x = Season, y = HomeShotsOnTarget), color = "red", size = 1.5)+
  geom_line(aes(x = Season, y= HomeShots), color = "black", size = 1.5)+
  geom_line(aes(x=Season, y = HomeCorners ), color = "orange", size = 1.5)+
  geom_line(aes(x=Season, y = HomeFouls ), color = "blue", size = 1.5)+
  geom_line(aes(x=Season, y= HomeRedCards), color = "purple", size = 1.5)+
  geom_line(aes(x=Season, y= HomeYellowCards), color = "green", size = 1.5)+
  geom_line(aes(x=Season, y= HomeGoals), color = "yellow", size = 1.5) +
  labs(
    x = "Season",
    color = "Legend"
  )+
  scale_color_manual(values = colors)




  



## gathering data
data_for_chart <- chelsea_data %>% 
  gather(key = stats , value = result, -Season) %>% 
  group_by(Season, stats) %>% 
  summarise(
    result = sum(result), 
    .groups = "drop"
  )

# Goals of chelsea
chelsea <- soccer_df %>% 
  select(HomeTeam, HomeGoals, HomeShots, HomeShotsOnTarget, HomeCorners,
         HomeFouls, HomeYellowCards, HomeRedCards) %>% 
  filter(HomeTeam == "Chelsea") %>% 
  filter(HomeGoals == max(HomeGoals)) %>% 
  pull(HomeGoals)

# Home shots taken
chelsea_shots <- soccer_df %>% 
  select (HomeShots, HomeShotsOnTarget, HomeTeam) %>% 
  filter(HomeTeam == "Chelsea") %>% 
  filter (HomeShots == max(HomeShots)) %>% 
  pull(HomeShots)

# Shots on target  
Chelsea_on_target <- soccer_df %>% 
  select (HomeShots, HomeShotsOnTarget, HomeTeam) %>%
  filter(HomeTeam == "Chelsea") %>% 
  filter (HomeShotsOnTarget == max(HomeShotsOnTarget)) %>% 
  pull(HomeShotsOnTarget)

# Chelsea home corner status 
Chelsea_corners <- soccer_df %>% 
  select(HomeTeam, HomeCorners) %>% 
  filter(HomeTeam == "Chelsea") %>% 
  filter(HomeCorners == max(HomeCorners)) %>% 
  pull(HomeCorners)

# Chelsea home foul status 
Chelsea_fouls <- soccer_df %>% 
  select(HomeTeam, HomeFouls) %>% 
  filter(HomeTeam == "Chelsea") %>% 
  filter(HomeFouls == max(HomeFouls)) %>% 
  pull(HomeFouls)

# Chelsea home yellow cards
Chelsea_yello <- soccer_df %>% 
  select(HomeTeam, HomeYellowCards) %>% 
  filter(HomeTeam == "Chelsea") %>% 
  filter(HomeYellowCards == max(HomeYellowCards)) %>% 
  pull(HomeYellowCards)

# Chelsea home red cards
Chelsea_red <- soccer_df %>% 
  select(HomeTeam, HomeRedCards) %>% 
  filter(HomeTeam == "Chelsea") 
  filter(HomeRedCards == max(HomeRedCards)) %>% 
  pull(HomeRedCards)

## Data for chart 1 Home games

  
  
  
  
  
