library(tidyverse)

gapminder <- read_csv("https://ucd-r-davis.github.io/R-DAVIS/data/gapminder.csv")

summary(gapminder)

##Question 1
  
gapminder %>%
    group_by(year, continent) %>%
    summarize(mean_life_expectancy = mean(lifeExp, na.rm = TRUE)) %>%  
    ggplot() + geom_point(aes(x = year, y = mean_life_expectancy, color = continent))+ 
    geom_line(aes(x = year, y = mean_life_expectancy, color = continent))


##Question 2

ggplot(data = gapminder, mapping = aes(x = gdpPercap, y = lifeExp)) +
  geom_point(aes(color = continent), size = pop) + 
  scale_x_log10() +
  geom_smooth(method = 'lm', color = 'black', linetype = 'dashed') +
  theme_bw()


##Question 3

nations <- c("Brazil", "China", "El Salvador", "Niger", "USA")

gapminder %>%
filter(nation%in%nations) %>%
ggplot(aes(x=country, y = lifeExp))
+geom_boxplot()
+geom_jitter(alpha = 0.3, color = "tomato")) 
+theme_bw()
+ggtitle("Overall Life Expectancy for Five Nations")
+xlab("Nation") + ylab("Life Expectancy")

  