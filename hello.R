## this is R programing
print('hello world')

print('this is a second line')

library(dplyr)

df <- read_csv('filename.csv')

df %>% 
  filter(col>100)

df %>%
  select(1:10) %>%
  filter(country == 'Thailand') %>%
  arrange(-income)