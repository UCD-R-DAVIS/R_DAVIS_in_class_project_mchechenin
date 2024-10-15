surveys <- read.csv("data/portal_data_joined.csv")
nrow(surveys)
ncol(surveys)

str(surveys)
surveys

nrow(surveys)
ncol(surveys)

str(surveys)

class(surveys)

summary(object = surveys)
summary.data.frame(surveys)

surveys[1,5]
head(surveys, 1)

surveys[1:5,]

surveys[c(1,5,24, 3001),]

head(surveys, 1)

surveys[1,]

dim(surveys[1])
head(surveys, 1)

surveys[1,]
surveys[,1]

dim(surveys[1])

surveys['record_id']
head(surveys,1)


tail(surveys)
head(surveys)
surveys[1:6,]

surveys[1,]
surveys[,1]
head(surveys[1])
head(surveys[,1])

head(surveys["genus"])
head(surveys[["genus"]])


head(surveys[c("genus", "species")])

head(surveys['genus,'])
head(surveys[,'genus'])
str(surveys)

surveys$genus


surveys$hindfoot_length

class(surveys$hindfoot_length)
