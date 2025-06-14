pacman::p_load(tidyverse, miceadds)
robots <- read_csv("Data/robots_cleaned.csv")

#Education

primary <- filter(robots, education == 0 | education ==1)
middle <- filter(robots, education == 2)
university <- filter(robots, education ==3)


fit_ed_model <- function(dataset){
  model <- lm.cluster(data = dataset, formula = Quality ~ Robot + Robot*reg_edu + age + gender + marriage + health + lnGDP
                      + structure + lnaverwage + as.factor(year) + as.factor(province),
                      cluster = "id")
  model_summary <- summary(model)
  return(model)
}

fit_skill_model <- function(dataset){
  model <- lm.cluster(data = dataset, formula = Quality ~ Robot + Robot*skill + age + gender + marriage + health + lnGDP
                      + structure + lnaverwage + as.factor(year) + as.factor(province),
                      cluster = "id")
  model_summary <- summary(model)
  return(model)
}

ed_models <- map(.f = fit_ed_model, .x = list(primary, middle, university))
skill_models <-  map(.f = fit_skill_model, .x = list(primary, middle, university))

