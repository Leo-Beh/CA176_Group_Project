#load other file -----------------------------
load("underscore_unformat_k.R")

underscore_unformatted_companies_df$Industry <- 
  as.character(underscore_unformatted_companies_df$Industry)                    #converting all values in the industry column to characters

industry_mean_salary <- underscore_unformatted_companies_df %>%
                                                                                #calculating the average salary of each industry and then grouping by the industry
  group_by(Industry) %>%
  summarise(mean_salary_per_industry = mean(Avg_salary_, na.rm = TRUE))

write.csv(industry_mean_salary, "industry_mean_salary.csv")                                                       #saving the dataframe as a csv file
new_companies_df <- data.frame(merge(industry_mean_salary, underscore_unformatted_companies_df, sort = TRUE))     #merging the original dataframe and the new average salary dataframe

View(new_companies_df)
