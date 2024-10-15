surveys <- read.csv("data/portal_data_joined.csv")

library("tidyverse")

surveys

summary(surveys)

colnames(surveys)

surveys_base <- surveys[1:5000, c(6, 9, 13)]

surveys_base <- surveys_base[complete.cases(surveys_base),
                              
surveys_base

surveys_base$species_id <- factor(surveys$species_id) 
       
surveys_base$plot_type <- factor(surveys$plot_type)

surveys %>%
  filter(!is.na(weight)) %>%
  group_by(sex, species_id) %>%
  summarize(mean_weight = mean(weight))

## If there are only a few fixed values that a variable can take, 
###it might be more useful to store the variable as a factor.
### Factors introduce the concept of categories, as opposed to simply text data.

##Factor also tells R what values variables can take, as well as their ordering.
##Meanwhile, character stores strings as a raw input.

## Names of countries, for instance, should be stored as characters.
## Emissions policy instituted vs no emissions policy instituted would be a factor.
### Whether Yes or No answers appear first.


challenge_base <- surveys_base %>%
  filter(weight > 150) %>%
  select(weight)




