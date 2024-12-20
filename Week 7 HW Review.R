# HW 7 Review -------------------------------------------------------------
library(tidyverse)

gapminder <- read_csv("https://ucd-r-davis.github.io/R-DAVIS/data/gapminder.csv")

pg <- gapminder %>% 
  select(country, year, pop, continent) %>% 
  filter(year > 2000) %>% 
  pivot_wider(names_from = year, values_from = pop) %>% 
  mutate(pop_change_0207 = `2007` - `2002`)

pg %>% 
  filter(continent != "Oceania") %>% 
  ggplot(aes(x = reorder(country, pop_change_0207), y = pop_change_0207)) +
  geom_col(aes(fill = continent)) +
  facet_wrap(~continent, scales = "free") +
  theme_bw() +
  ## one other option: scale_fill_brewer(palette = "Set2")
  ##instead ofscale_fill_viridis_d()
  scale_fill_viridis_d() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1), 
        legend.position = "none") +
  xlab("Country") +
  ylab("Change in Population Between 2002 and 2007") +
  coord_flip()

# Creating Functions ------------------------------------------------------
# Learning Objectives: 
## Define a function that takes arguments
## Set default value for function arguments
## Explain why we should divide programs into small, single-purpose functions



## Defining a function -----------------------------------------------------
# arguments are the input, return values are the output
# for now, we will work with functions that return a single value


# providing argument defaults so you don't have to specify every argument every time (e.g., na.rm = FALSE in mean)








# Process to write your own function --------------------------------------
## temperature conversion example: Farenheit to Kelvin
((50 - 32) * (5/9)) + 273.15
((62 - 32) * (5/9)) + 273.15
((72 - 32) * (5/9)) + 273.15

## How do write function: 
# 1. Identify what piece(s) will change within your commands -- this is your argument
# 2. Remove it and replace with object(s) name(s)
# 3. Place code and argument into the function() function


f_to_k <- function(tempF){
  k <- ((tempF - 32) * (5/9)) +273.15
  
  print("hello")
  return(k)
  
}

m <- f_to_k(72)
m

class(m)

## Pass-by-value: changes or objects within the function only exist within the function
## what happens in the function, stays in the function 





# source()ing functions ---------------------------------------------------





# Using dataframes in functions -------------------------------------------
# Say you find yourself subsetting a portion of your dataframe again and again 
# Example: Calculate average GDP in a given country, in a given span of years, using the gapminder data

gapminder %>%
  filter(country == "Canada", year %in% c(1950:1970)) %>%
  summarize(meanGDP = mean(gdpPercap, na.rm = TRUE))

#generalize this where we can change country and year range

avgGDP <- function (cntry, yr.range) {
  df <- gapminder %>%
    filter(country== cntry, year %in% yr.range) %>%
    summarize(meanGDP = mean(gdpPercap, na.rm = TRUE))
    return(df)
}

avgGDP(cntry = "United States", yr.range = 1980:1995)

# Challenge ---------------------------------------------------------------
# Write a new function that takes two arguments, the gapminder data.frame (d) 
##and the name of a country (e.g. "Afghanistan"), and plots a time series of the 
##country’s population. The return value from the function should be a ggplot object.
##Note: It is often easier to modify existing code than to start from scratch. 
##To start out with one plot for a particular country, figured out what you need to 
##change for each iteration (these will be your arguments), and then wrap it in a function.

country_plot <- function(cntry){
  d <- gapminder %>%
    select(country, year, pop) %>%
    filter(country == cntry) %>%
    ggplot(aes(x = year, y = pop)) +
    geom_point() 
    return(d)
}
country_plot("Afghanistan")
