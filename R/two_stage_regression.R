
#install.packages("pacman")
pacman::p_load(tidyverse, readxl, readr, ExPanDaR, janitor)

df <- read_excel("Data/pone.0298081.s001.xlsx", sheet = 1) %>%
  bind_rows(read_excel("Data/pone.0298081.s001.xlsx", sheet = 2))
df <- df %>%
  clean_names()

names(df)


robots <- read_excel("datas002.xlsx")
trunc.robots <- treat_outliers(robots)


names(robots)




