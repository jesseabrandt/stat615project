pacman::p_load(tidyverse, readxl, readr, ExPanDaR)

robots <- read_excel("Data/pone.0298081.s002.xlsx")
robots <- robots %>%
  mutate(id = as.factor(id))

#apparently they only truncate this one column? at least according to the summary statistics
robots$Quality <- treat_outliers(robots$Quality)

selected_variables <- robots %>%
  select(Quality, Robot, age, gender, marriage, health, lnGDP, structure, lnaverwage)
#get summary statistics
mapply(FUN = \(x) c(N = length(x), mean = mean(x), sd = sd(x), min = min(x), max = max(x)),
       selected_variables) %>%
  t()

write_csv(robots, "Data/robots_cleaned.csv")


#maybe the problem is something about those ages