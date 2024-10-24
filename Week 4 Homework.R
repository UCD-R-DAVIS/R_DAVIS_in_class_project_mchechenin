library(tidyverse)

##1
surveys <- read_csv("data/portal_data_joined.csv")

##2
surveys1 <- surveys %>%
  filter(weight > 30 & weight < 60) %>%
  print(n = 6)

##3

biggest_critters <- surveys %>%
  filter(!is.na(weight)) %>%
  group_by(species_id, sex) %>%
  summarize(max_weight = max(weight)) %>%
  arrange(-max_weight)

biggest_critters

##4

filtered_nas <- surveys %>%
filter(is.na(weight)) %>%
group_by(species_id) %>% 
tally() %>%
arrange(-n)

filtered_nas



##5

surveys <- summarise()

surveys_average_weight <- surveys %>%
  filter(!is.na(sex)) %>%
  group_by(species_id, sex) %>%
  mutate(average_weight = mean(weight, na.rm = TRUE)) %>%
  select(species_id, sex, weight, average_weight)

surveys_average_weight

##6

surveys_average_weight <- surveys_average_weight %>%
  mutate(above_average = weight > average_weight)
