# Replicate the following code below *without* using the pipe (%>%) operator!

library(tidyverse)
library(titanic)

titanic_df <- as.data.frame(Titanic)

titanic_df_new <- titanic_df %>% 
  filter(Survived == "Yes") %>% 
  mutate(Class = recode(Class, "1st" = 1, "2nd" = 2, "3rd" = 3, "Crew" = 0)) %>%
  mutate(Adult = recode(Age, "Child" = 0, "Adult" = 1)) %>%
  select(-Age) %>% 
  filter(Sex == "Female", Adult == 1)  
  
  
# Which passengers of the Titanic we kept using the code above? 
# What could be an alternative to the subsequent use of mutate() and select() ?  
  
# Produce the same output as the code below *with* using the pipe (%>%) operator!

data(ToothGrowth) # result from an experiment studying the effect of vitamin C on tooth growth in 60 Guinea pigs

toothgrowth_df <- as.data.frame(ToothGrowth)

toothgrowth_df <- rename(toothgrowth_df, toothLenghth = len)
toothgrowth_df <- rename(toothgrowth_df, supplementType = supp)
toothgrowth_df <- filter(toothgrowth_df, between(toothLenghth, 10, 25.5))
toothgrowth_df <- arrange(toothgrowth_df, dose)
toothgrowth_df <- mutate(toothgrowth_df, dose_mcg = dose*1000) # converting milligrams to micrograms
  