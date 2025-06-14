
pacman::p_load(tidyverse, miceadds)
robots <- read_csv("Data/robots_cleaned.csv")

#Gender
man <- filter(robots, gender == 1)
woman <- filter(robots, gender ==0)

#Education
unique(robots$education)
count(robots, education)
690 + 4763 # 0 and 1 are primary
# 2 is middle
# 3 is university
primary <- filter(robots, education == 0 | education ==1)
middle <- filter(robots, education == 2)
university <- filter(robots, education ==3)

#Age groups
age_1 <- filter(robots, age >= 17 & age <= 25)
age_2 <- filter(robots, age >= 26 & age <= 35)

# Regional employment
large <- filter(robots, reg_labor > mean(reg_labor))
small <- filter(robots, reg_labor <= mean(reg_labor))

#temp


fit_fe_model <- function(dataset){
  model <- lm.cluster(data = dataset, formula = Quality ~ Robot + age + gender + marriage + health + lnGDP
             + structure + lnaverwage + as.factor(year) + as.factor(province),
             cluster = "id")
  model_summary <- summary(model)
  return(model_summary[2,1:4])
}

fit_fe_model(large)
tbl <- map(.x = list(man,woman,primary,middle,university,large,small), .f = fit_fe_model) %>%
  data.frame()
names(tbl) <- c("Man", "Woman", "Primary", "Middle", "University", "Large", "Small")

rownames(tbl)[1] <- "Estimate (Robot)"
tbl

