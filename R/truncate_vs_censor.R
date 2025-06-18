pacman::p_load(tidyverse, readxl, readr, ExPanDaR)

robots <- read_excel("Data/pone.0298081.s002.xlsx")
robots <- robots %>%
  mutate(id = as.factor(id))

#apparently they only truncate this one column? at least according to the summary statistics

robots$quality_original <- robots$Quality
robots$quality_trunc <- treat_outliers(robots$Quality, truncate = TRUE)
robots$Quality <- treat_outliers(robots$Quality)

robots2 <- robots %>% select(Quality, quality_trunc, quality_original)


selected_variables <- robots %>%
  select(Quality, quality_original, quality_trunc)
#get summary statistics
mapply(FUN = \(x) c(N = sum(!is.na(x)), mean = mean(x, na.rm =TRUE), 
                    sd = sd(x, na.rm =TRUE), min = min(x, na.rm =TRUE), 
                    max = max(x, na.rm =TRUE)),
       selected_variables) %>%
  t()


sum(is.na(robots2$quality_trunc))
