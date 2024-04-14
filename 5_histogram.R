library(readxl)
library(dplyr)
library(ggplot2)


# Load graph --------------------------
hist <- ggplot(data = underscore_unformatted_companies_df, aes(x = Avg_salary_)) +
  geom_histogram(binwidth = 20, boundary = 1, col = "black", fill = "skyblue") + #Add histogram with a unique binwidth, boundary, colour and fill
  scale_x_sqrt(name = "Average Salary", limits = c(10000,80000)) +              #Scale the x-axis with a name and limits on average salary
  scale_y_sqrt(name = "Companies count", limits = c(0, 150)) +                  #Scale the y axis with a name and limits on companies count
  theme(panel.grid.major = element_blank(),                                     #Remove major grid lines
        panel.grid.minor = element_blank(),                                     #Remove minor grid lines
        panel.border = element_blank(),                                         #Remove panel border
        axis.line = element_line(colour = "black"))                             #Set colour of axis lines


#Save plot ----------------------------
ggsave("histogram.png", width = 35, height = 20, units = "cm")                  # Save plot as a png
hist                                                                            #Show the histogram