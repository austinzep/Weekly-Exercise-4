library(usethis)
git_default_branch()
# [1] "main"  - This is what we're looking for!

# Step 6 - using Olympics.csv

library(readr)
library(tidyverse)
library(ggplot2)

olympics = read_csv("Olympics.csv")

class(olympics$gold)
class(olympics$silver)
class(olympics$bronze) # all numeric classes. I should be able to just sum them.

olympics2 = olympics %>%
  mutate(total.medals = gold + silver + bronze)

view(olympics2) # the column is present and accurate.

golds_per_country = olympics2 %>%
  group_by(country) %>%
  summarise(gold = sum(gold, na.rm = T))

view(golds_per_country) # looks good.