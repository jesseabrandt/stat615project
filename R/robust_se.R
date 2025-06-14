pacman::p_load(sandwich, lmtest, miceadds)

#https://www.r-bloggers.com/2021/05/clustered-standard-errors-with-r/

#with 1 truncated
robots <- read.csv("Data/robots_cleaned.csv")
model1 <- lm(data = robots, formula = Quality ~ Robot + age + gender + marriage + health + lnGDP
             + structure + lnaverwage + as.factor(year) + as.factor(province))

model2 <- lm.cluster(data = robots, formula = Quality ~ Robot + age + gender + marriage + health + lnGDP
                     + structure + lnaverwage + as.factor(year) + as.factor(province),
                     cluster = "id")
summary(model2)


#with all truncated
robots <- read_excel("Data/pone.0298081.s002.xlsx")
robots <- robots %>%
  mutate(id = as.factor(id), province = as.factor(province))
trunc.robots <- treat_outliers(robots, truncate = FALSE)

model3 <- lm.cluster(data = trunc.robots, formula = Quality ~ Robot + age + gender + marriage + health + lnGDP
                     + structure + lnaverwage + as.factor(year) + as.factor(province),
                     cluster = "id")
summary(model3)

summary(model2)[1:9,1:4]
summary(model3)[1:9,1:4]

ms2[1:9,1:4]
ms3[1:9,1:4]