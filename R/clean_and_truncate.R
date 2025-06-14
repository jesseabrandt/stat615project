pacman::p_load(tidyverse, readxl, readr, ExPanDaR)

robots <- read_excel("Data/pone.0298081.s002.xlsx")
robots <- robots %>%
  mutate(id = as.factor(id))

trunc.robots <- treat_outliers(robots)
write_csv(trunc.robots, "Data/robots_cleaned.csv")