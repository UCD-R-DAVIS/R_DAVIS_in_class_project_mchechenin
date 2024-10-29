library(tidyverse)

surveys <- read_csv("data/portal_data_joined.csv")

##Q1

surveys %>%
filter(!is.na(hindfoot_length)) %>%
group_by(genus, plot_type) %>%
summarize(mean_hindfoot_length = mean(hindfoot_length)) %>%
pivot_wider(names_from = "plot_type", values_from =  "mean_hindfoot_length") %>%
arrange(Control)

##Q2

summary(surveys$weight)

colnames(surveys)

surveys %>%
  mutate(weight = case_when(
    weight <=  20 ~ "small",
    is.na(weight) ~ NA_character_,
    weight > 20 & weight < 48 ~ "medium",
    TRUE ~ "large")) %>% 
  select(weight) %>% 
  group_by(weight) %>%
  tally()


surveys %>%
      mutate(weight_cat = ifelse(weight <= 20, "small", 
                  ifelse(weight >20 & weight < 48, "medium", "large")))

