
library(readxl)
library("dplyr")
library(ggplot2)



underscore_unformatted_companies_df <- unformat_numeric_df(companies_df, c("Avg_salary", "Interviews_taken", "Total_jobs_available", "Total_reviews", "Total_benefits"))

average_salary <- underscore_unformatted_companies_df$Avg_salary_
average_salary[is.na(average_salary)] <- 0


View(average_salary)



hist <- ggplot(underscore_unformatted_companies_df, aes(x = average_salary)) +
  geom_histogram(aes(y = ..density..), binwidth = 500, fill = "skyblue", color = "black") +
  scale_x_continuous(limits = c(0,10000), breaks = seq(0,10000, by = 1000)) +
  labs(
    title = "Histogram of average salarys",
    subtitle = "For comapnies only rated for Job Security",
    x = "Average salarys",
    y = "Densitys",
    caption = "A major skew to the right showing us the average salarys are quite similar in this data set") +
  
  theme(plot.title = element_text(hjust = 0.5, face = "bold.italic"),
        legend.position = "left",
        axis.text.x = element_text(angle = 45, hjust = 1, size = 10), #Rotate and adjust font size of x-axis labels
        axis.text = element_text(size = 10, face = "italic"),
        panel.grid.major = element_blank(), #Remove major grid lines
        panel.grid.minor = element_blank(), #Remove minor grid lines
        panel.border = element_blank(), #Remove panel border
        axis.title = element_text(size = 12, face = "bold.italic")) 
print(hist)

