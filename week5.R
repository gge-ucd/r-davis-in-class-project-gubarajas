#shortcut for piping %>% is command + shift + m 
biggest_critters <- surveys %>% 
  filter(!is.na(weight) & !is.na(sex) & !is.na(sex)) %>% 
  group_by(species,sex) %>% 
  summarize(maximum_weight = max(weight))
biggest_critters


surveys %>% 
  filter(is.na(hindfoot_length)) %>% 
  group_by(species) %>% 
  tally()

surveys %>% 
  filter(is.na(hindfoot_length)) %>% 
  group_by(species) %>% 
  summarize(count = n(), mean = mean(weight, na.rm = T))

sum(is.na(surveys$weight))

colSums(is.na(surveys))

#conditional statements 
surveys %>% 
  filter(!is.na(weight)) %>% 
  mutate(weight_cat = case_when(weight > mean(weight) ~ "big", 
                                weight < mean(weight) ~ "small")) %>% 
  select(weight, weight_cat) %>% 
  tail()

#using data built into R 
data("iris")
summary(iris$Petal.Length)

iris %>% 
  filter(!is.na(Petal.Length)) %>% 
  mutate(length_cat = case_when(Petal.Length < 1.6 ~ "small",
                                Petal.Length > 1.6 & Petal.Length < 5.1 ~ "medium",
                               TRUE ~ "large")) %>% 
  head()
###you use TRUE as the last condition cause it will just use the rest of the values that haven't been used aka any values that haven't met the previously specified conditions
#another way to do the same thing 
iris %>% 
  filter(!is.na(Petal.Length)) %>% 
  mutate(length_cat = case_when(Petal.Length < 1.6 ~ "small",
                                Petal.Length > 1.6 & Petal.Length < 5.1 ~ "medium",
                                Petal.Length > 5.1  ~ "large"))
#another way to do the same thing as above w/ small, mediium, and large

  iris %>% 
  mutate(length_cat = ifelse(Petal.Length <= 1.6, "small",
                      ifelse(Petal.Length >= 5.1, "large",
                             "medium")


#Joining two data frames
library(tidyverse)
surveys = read_csv('data/portal_data_joined.csv')
tail_length = read_csv('data/tail_length.csv')


str(tail_length)
str(surveys)

intersect(colnames(surveys),colnames(tail_length))

combo_dataframe = left_join(surveys,tail_length)
str(combo_dataframe)

surveys %>%  group_by(year, plot_id) %>%  tally()

#my attempt at the challenge that i didnt actually finish 
wide_survey <- surveys %>%  
  filter(!is.na()pivot_wider()

#tyler's approach
temp_df = surveys %>% group_by(year,plot_id) %>% tally()
temp_df= temp_df %>% ungroup()

pivot_wider(temp_df)
pivot_wider(temp_df,names_from = "year", values_from = "n")

str(temp_df)

pivot_wider(data = surveys,id_cols = c('plot_id'),
            names_from = year,values_fn = n)
?pivot_wider


surveys %>% group_by(plot_id,year) %>% summarize(n_distinct(genus))
surveys %>% group_by(plot_id,year) %>% summarize(length(unique(genus)))
         