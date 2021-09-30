###lecture on vectors, data frames, and lists

a <- 1
a <- 2
letters

temp <- c(4,6,8)
number_vector = c(4,6,8)
(number_vector= c(4,6,8))
(number_vector= c(23,32,45))

###how to pull up a certain value in the data set 
#use brackets to index a value or subset
number_vector[2]

##how to get the second place value
number_vector[c(2,2)]

##how to get the values in reverse order 
number_vector[c(3,2,1)]

##how to add a new value to your vector 
number_vector = c(number_vector, 54)
number_vector

#how to create a string, both double and single quotes work
my_string <- "string"
my_string

mystring <- "24"

##see if the values are numeric or characters 
class(mystring)

my_string <- c('dog', 'walrus', 'salmon')
data.frame(my_string)

data.frame(c(my_string,my_string))

##how to get two columns of the data 
data.frame(c(my_string),c(my_string))
##another way to make two columns of data
data.frame(first_column = my_string, second_column = my_string)


##working with lists
test_list = list('first string entry into list')
str(test_list)
test_list[1]
#getting the index at the beginning 
test_list[1][[1]]

##adding more to the list 
test_list[[1]][2] <- 'add next thing'
test_list

test_df <-data.frame(letters,letters)
test_list[[3]]<- test_df
str(test_list)
head(test_df)

test_list[[2]]
