
#install.packages("pacman")
pacman::p_load(tidyverse, readxl, readr, ExPanDaR, janitor)

df <- read_excel("Data/pone.0298081.s001.xlsx", sheet = 1) %>%
  bind_rows(read_excel("Data/pone.0298081.s001.xlsx", sheet = 2))
df <- df %>%
  clean_names()

names(df)


robots <- read_excel("Data/pone.0298081.s002.xlsx")
robots <- robots %>%
  mutate(id = as.factor(id))
trunc.robots <- treat_outliers(robots)

duplicate_ids <- trunc.robots %>%
  group_by(id) %>%
  mutate(count = length(id)) %>%
  filter(count>1)

names(robots)

#electricity is misspelled in the dataset
trunc.robots <- trunc.robots %>%
  mutate(avg_electricity = eletricity/workers)

lm(data = trunc.robots, formula = Robot~cable + avg_electricity)



