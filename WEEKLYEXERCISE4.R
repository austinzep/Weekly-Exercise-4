library(usethis)
git_default_branch()
# [1] "main"  - This is what we're looking for!

library(tidyverse)

olympics = read_csv("Olympics.csv")

largest_delegations = olympics %>%
  filter(year == 1992) %>%
  select(country, athletes) %>%
  arrange(desc(athletes))

str(largest_delegations) #it's a tibble
view(largest_delegations)
