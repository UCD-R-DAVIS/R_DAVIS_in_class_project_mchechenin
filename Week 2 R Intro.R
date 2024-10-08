
log(x=2, base = 4)

mynumber<-6

mynumber==5

mynumber > 4

othernumber <- -3

mynumber * othernumber

elephant1_kg <- 3492

elephant2_lb <- 7757

elephant1_lb <- elephant1_kg *2.2

elephant1_lb

elephant2_lb > elephant1_lb

myelephants <- c(elephant1_lb, elephant2_lb)

which(myelephants == max(myelephants))

getwd()

d <- read.csv("./data/tail_length.csv")

dir.create("./lectures")


#Treat raw data as read only

#Treat generated output as disposable

weight_g <- c(50, 60, 65, 82)
weight_one_value <- c(50)

animals <- c("mouse 'name'", "rat", "dog")
animals

length(weight_g)
str(weight_g)

weight_g <-c(weight_g, 90)

num_char <- c(1, 2, 3, "a")
num_logical <- c(1, 2, 3, TRUE)
char_logical <- c("a", "b", "c", TRUE)
tricky <- c(1, 2, 3, "4")

num_char

class(num_char)

num_char


#Chooses lowest common denominator to avoid data loss

#Vectors have to be the same class of variable


## Conditional subsetting

weight_g <- c(21, 34, 39, 54, 55)
weight_g > 50
weight_g[weight_g > 50]

### Symbols

%in%
  
animals %in% c("rat", "cat", "dog", "duck", "goat")

# %in% within a bucket

# == pairwise matching -- ORDER MATTERS!

