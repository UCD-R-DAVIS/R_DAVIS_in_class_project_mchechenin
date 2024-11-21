library(tidyverse)
library(lubridate)

mloa <- read_csv("https://raw.githubusercontent.com/gge-ucd/R-DAVIS/master/data/mauna_loa_met_2001_minute.csv")

summary(mloa)

mloa_new <- mloa %>%
filter(rel_humid != -99) %>%
filter(temp_C_2m != -999.9) %>%
filter(windSpeed_m_s != -999.9) %>%

mutate(datetime = ymd_hm(paste(year,"/", 
                         month, "/", 
                         day," ", 
                         hour24, ":", 
                         min), 
       tz = "UTC")) %>%
mutate(datetimeLocal= with_tz(datetime, tzone = "Pacific/Honolulu"))


## Graph
  

mloa_2 <- mloa_new %>%
mutate(localMon = month(datetimeLocal, label = TRUE),
         localHour = hour(datetimeLocal)) %>%
         group_by(localMon, localHour) %>%
         summarize(mean_temp = mean(temp_C_2m))



ggplot(mloa_2, aes(x = localMon, y = mean_temp)) +
  geom_point(aes(color = localHour)) +
  scale_fill_viridis_c() +
  xlab("Month") +
  ylab("Mean temperature (degrees Celsius)") +
  theme_bw()
