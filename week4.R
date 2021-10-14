surveys <- read.csv('data/portal_data_joined.csv')

install.packages("tidyverse")
library(tidyverse)

surveys_base <- select(surveys, species_id, weight, plot_type)

#another way to select those columns
surveys_base <- surveys[c('species.id', 'weight', 'plot type')]

#another way to do it 
surveys_base <- surveys %>% select(species_id, weight, plot_type)
?select
str(surveys)

#have this data frame only be the first 60 rows
surveys_base <- head(x = surveys_base, 60)
str(surveys_base)

#another way to do it 
surveys_base <- surveys_base[1:60,]

surveys_base <- surveys [c(1:60),c(6,9,13)]
surveys_base %>% str()
surveys_base <- head(surveys[c(6,9,13)], n=60)
str(surveys_base)

#convert to factors
surveys_base$species_id <- as.factor(surveys_base$species_id)
#to check
is.factor(surveys_base$species_id)
class(surveys_base$species_id)

#remove all rows w NAs in column 
surveys_base_nonas <- na.omit(surveys_base)
str(surveys_base_nonas)

surveys_base_nonas <- na.omit(surveys_base$weight)
str(surveys_base_nonas)

is.na(surveys_base$weight)
#is not na
!is.na(surveys_base$weight)

#piping gives edited data frame
surveys_base %>% na.omit(surveys_base$weight)
na.omit(surveys_base, surveys_base$weight)

surveys_base[!is.na(surveys_base$weight),]
#another way to do it thats not as great cause it would remove all NAs 
#it only works in this case cause weight is the only one with NAs
surveys_base[complete.cases(surveys_base),]

##challenge
challenge_base <- surveys_base[which(surveys_base$weight>150),]
summary(challenge_base$weight)










###in classs stuffff 

surveys <- read.csv('data/portal_data_joined.csv')
library(dplyr)
#1. keep only observations before 1995
surveys_base <- filter(surveys, year < 1995)

surveys_base <- select(surveys_base,year,sex,weight)
str(surveys_base)

#how to do the same thing as above but in one line of code w piping
surveys_base <- filter(surveys,year<1995) %>% select(year,sex,weight)
#another way to use piping
surveys_base <- surveys %>% filter(year<1995)  %>% select (year,sex,weight)

surveys_base <-filter(select(surveys,year,sex,weight),year<1995)





summary(surveys)
str(surveys)
#Create a new data frame from the surveys data that meets the following criteria:
#1. contains only the species_id column
#2. and a new column called hindfoot_half containing values that are half the hindfoot_length values.
#3. In this hindfoot_half column, there are no NAs and all values are less than 30.
#Name this data frame surveys_hindfoot_half.
surveys$hindfoot_length

surveys_hindfoot_half <- surveys %>% 
  filter(!is.na(hindfoot_length)) %>%
  mutate(hindfoot_half = hindfoot_length/2) %>% 
  select(species_id,hindfoot_half) %>% 
  filter(hindfoot_half < 30) 

str(surveys_hindfoot_half)



#Use group_by() and summarize() to find the mean, min, and max hindfoot length
#for each species (using species_id).
summarize(surveys)
str(surveys)

surveys_hindfoot_half %>% 
  group_by(species_id) %>%
  mutate(hindfoot_length = hindfoot_half * 2) %>%
  summarize(mean(hindfoot_length), min(hindfoot_length), max(hindfoot_length)) %>%
  head()

summarize(surveys_summarize, mean())
