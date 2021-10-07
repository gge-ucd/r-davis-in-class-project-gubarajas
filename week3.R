##going over hw2
set.seed(15)
?set.seed()
hw2 <- runif(50,4,50)
?runif
hw2 <- replace(hw2, c(4,12,22,27), NA)
hw2

#Nas are special values
hw2 [hw2 !=NA]
hw2 [hw2 != "NA"]

#important functions
prob1 <- hw2[!is.na(hw2)]

#select all numbers from 14 and 38 inclusive
prob1 <- prob1[prob1[prob1 >=14 & prob1 <= 38]]

#multiply each number in the number vector by 3
#vector math
times3 <- prob1 * 3
times3

#add 10 to each number in times3 vector
## more vector math
plus10 <- times3 + 10

#select every other number in plus10 vector
?seq
length(plus10)
odds <- seq(from = 1, to = 23, by = 2)
odds
final <- plus10[odds]
final

#making code better (soft-coding)
seq(from = 1, to = length(plus10), by = 2)
#same as whats above
seq(1,23,2)
#soft-coding version without specifying arguments
seq(1,length(plus10), 2)

#vector recycling
plus10[c(TRUE, FALSE)]

#tabcompletion
mean()


###week 3 class
surveys <- read.csv("data/portal_joined_data.csv")

surveys <- portal_data_joined
surveys
str(surveys)
nrow(surveys)
ncol(surveys)
#look at first 6 rows
head(surveys)
#look at more or fewer rows
?head
head(surveys, n=)
#another way to look at data overall
summary(surveys)

#subsetting rom a data frame 
surveys[1,2] #row 1 and column2

#looking at all of the values of a column
surveys$species
#looking at unique values in a column 
unique(surveys$species)
#number of unique values 
length(unique(surveys$species))
#shows number of values of each unique value
table(surveys$species)
#reverse unique, something that is not duplicated, then sum it
sum(!duplicated(surveys$species))
#levels as a way to identify unique characters (factor)
#starting with characters is good
is.factor(surveys$species)
levels(surveys$species)

?factor
species_factor <- factor(surveys$species)
class(species_factor)
##factors are actually numbers but they have order 
levels(species_factor)


##in-class challenge
surveys_200 <- surveys[1:200,]

nrow(surveys)
surveys_last <- surveys[34786,]
tail(surveys)
?tail

surveys_middle <- surveys[nrow(surveys)/2,]

##duplicate head
surveyshead <- surveys[-(7:nrow(surveys)),]
surveyshead
