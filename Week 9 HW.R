library(tidyverse)

surveys <- read.csv("data/portal_data_joined.csv")

##Question 1

  for(i in unique(surveys$taxa)){
    print(i)
    taxon <- surveys[surveys$taxa == i,]
    longestnames <- mytaxon[nchar(mytaxon$species) == 
    max(nchar(mytaxon$species)),] %>% select(species)
    print(paste0("The longest species name(s) among ", i, "s is/are: "))
    print(unique(longestnames$species))
  }

##Question 2

mycols <- mloa %>% select("windDir","windSpeed_m_s","baro_hPa","temp_C_2m",
          "temp_C_10m","temp_C_towertop","rel_humid", "precip_intens_mm_hr")
mycols %>% map(max, na.rm = TRUE)

##Question 3

Celsius_to_Fahrenheit <- function(x){x * 1.8 + 32}

mloa$temp_F_2m <- Celsius_to_Fahrenheit(mloa$temp_C_2m)
mloa$temp_F_10m <- Celsius_to_Fahrenheit(mloa$temp_C_10m)
mloa$temp_F_towertop <- Celsius_to_Fahrenheit(mloa$temp_C_towertop)


