library(tidyverse)
library(dplyr)

file <- 'https://raw.githubusercontent.com/ucd-cepb/R-DAVIS/refs/heads/main/data/tyler_activity_laps_10-24.csv'

data <- read_csv(file)

summary(data)

colnames(data)
      
running <- data %>%
filter(sport == "running") %>%
filter(minutes_per_mile < 10 & minutes_per_mile > 5) %>%
mutate(pace = case_when(
minutes_per_mile < 6 ~ "fast",
is.na(minutes_per_mile) ~ NA_character_,
minutes_per_mile >= 6 & minutes_per_mile < 8 ~ "medium",
TRUE ~ "slow")) %>%
mutate(form = case_when(
year == 2024 ~ "new",
is.na(year) ~ NA_character_,
year == 2023 ~ "old",
TRUE ~ NA_character_))


running %>%
filter(!is.na(minutes_per_mile)) %>%
  group_by(minutes_per_mile, form)
summarize(average_spm = mean(steps_per_minute)) %>%
pivot_wider(names_from = "form", values_from =  "minutes_per_mile") %>%
arrange(Control)

running %>%
mutate(months=ifelse(month%in% 1:6, "early 2024", "late 2024")) %>%
group_by(months) %>%
summarize(
minimum_steps_per_minute = min(steps_per_minute),
median_steps_per_minute = median(steps_per_minute),
mean_steps_per_minute = mean(steps_per_minute),
maximum_steps_per_minute = max(steps_per_minute))


