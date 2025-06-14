pacman::p_load(tidyverse, miceadds)
robots <- read_csv("Data/robots_cleaned.csv")

model.6.1 <- lm.cluster(data = robots, formula = Quality ~ Robot + Robot*reg_edu  + age + 
                          gender + marriage + health + lnGDP + structure + lnaverwage + 
                          as.factor(year) + as.factor(province), cluster = "id")
summary(model.6.1)

model.6.2 <- lm.cluster(data = robots, formula = Quality ~ Robot + Robot*skill  + age + 
                          gender + marriage + health + lnGDP + structure + lnaverwage + 
                          as.factor(year) + as.factor(province), cluster = "id")
summary(model.6.2)

model.6.3 <- lm.cluster(data = robots, formula = Quality ~ Robot + Robot*entrepreneurship  + age + 
                          gender + marriage + health + lnGDP + structure + lnaverwage + 
                          as.factor(year) + as.factor(province), cluster = "id")
summary(model.6.3)
