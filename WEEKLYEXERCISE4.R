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
  summarise(gold = sum(gold, na.rm = T)) # NA's removed.

view(golds_per_country) # looks good.

medals_per_year = olympics2 %>%
  select(year, total.medals) %>%
  group_by(year) %>%
  summarise(medals = sum(total.medals, na.rm = T))

view(medals_per_year) # looks good.

# merged from main
library(tidyverse)

olympics = read_csv("Olympics.csv")

largest_delegations = olympics %>%
  filter(year == 1992) %>%
  select(country, athletes) %>%
  arrange(desc(athletes))

str(largest_delegations) #it's a tibble
view(largest_delegations)

library(ggplot2)
olympics %>%
  filter(country %in% c(
    "United States", "France", "Germany", "Russia", "China")) %>%
  select(country, year, gold) %>%
  ggplot(aes(x = year, y = gold, colour = country)) +
  geom_line() +
  geom_point()
