set.seed(15) #tells computer where to pull a number from
hw2 <- runif(50, 4, 50) #random uniform function w/ n= 50, min= 4, max = 50
hw2 <- replace(hw2, c(4,12,22,27), NA) #replaces values 4, 12, 22, 27 with NA
hw2 #prints the data so that it is visible in the console


prob1 <- na.omit(hw2)

prob1 <- prob1[prob1>=14 & prob1<=38]

prob1

multiplied <- prob1*3

multiplied

added <- multiplied + 10

added

subset <- added[c(TRUE, FALSE)]

subset