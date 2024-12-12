library(tidyverse)

##Question 1

data <- read_csv("https://raw.githubusercontent.com/UCD-R-DAVIS/R-DAVIS/refs/heads/main/data/tyler_activity_laps_12-6.csv")

nrow(data)
ncol(data)

summary(data)

##Question 2 & Question 3

running <- data %>%
  filter(sport == "running") %>%
  filter(minutes_per_mile < 10 & minutes_per_mile > 5) %>%
  filter(total_elapsed_time_s > 1* 60)

##Question 4

##grouped_by_period <- running %>% 
  #mutate(time_period = case_when(
    #date <= "2023-12-31" ~ "pre-2024", 
    #date >= "2024-01-01" & date <= "2024-06-30" ~ "rehab", 
    #date >= "2024-07-01" ~ "current activity"))

library(lubridate) 
                              
running <- running %>% 
  mutate(datetime = ymd(paste(year, month, day, sep = "-")) 
                                                            
grouped_by_period <- running %>% 
  mutate(time_period = case_when(
  datetime <= ymd("2023-12-31") ~ "pre-2024", 
  datetime >= ymd("2024-01-01") & datetime <= ymd("2024-06-30") ~ "rehab", 
  datetime >= ymd("2024-07-01") ~ "current activity" ) )

##Question 5

ggplot(running, aes(x = minutes_per_mile, y = steps_per_minute, color = time_period)) +
  geom_point(alpha = 0.6) +
  geom_smooth(method = "lm", se = FALSE) +
  labs(
    title = "Relationship between SPM and Speed",
    x = "Speed (miles per minute)",
    y = "Steps Per Minute (SPM)",
    color = "Running Pace") +
  theme_minimal() 
