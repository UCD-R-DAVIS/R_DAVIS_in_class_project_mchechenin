library(tidyverse)

gapminder <- read_csv("data/gapminder.csv")

str(gapminder)

population_growth <- gapminder |>
  select(country, continent, year, pop) |>
  filter(year > 2001) |>
  pivot_wider(names_from = year, values_from = pop) |>
  mutate(population_change_2007 = `2007` - `2002`)

str(population_growth)

plot <- population_growth |>
  filter(continent != "Oceania") |>
  ggplot(aes(x=reorder(country, population_change_2007), 
             y=population_change_2007)) + geom_col(aes(fill=continent)) +
             facet_wrap(~ continent, scales = "free") + 
             theme_bw() +
             scale_fill_viridis_d() + 
             theme(axis.text.x = element_text(angle = 45, hjust = 1),
             legend.position = "none") +
             xlab("Country") +
             ylab("Population Changes Between 2002 and 2007")



ggsave("plot.png", plot, width = 16.00, height = 12.00)
         
         