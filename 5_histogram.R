library(readxl)
library(dplyr)
library(ggplot2)


# Load graph ------------------------------------
hist <- ggplot(data = underscore_unformatted_companies_df, aes(x = Avg_salary_)) +
  geom_histogram(binwidth = 20, boundary = 1, col = "black", fill = "skyblue") + #Add histogram with a unique binwidth, boundary, colour and fill
  scale_x_sqrt(limits = c(10000,80000)) +                                       #Scale the x-axis with limits on average salary squared
  scale_y_continuous(limits = c(0, 120),
                     breaks = seq(0, 120, 20)) +                                #Scale the y axis continuously by 20 to 120
  theme(panel.grid.major = element_blank(),                                     #Remove major grid lines
        panel.grid.minor = element_blank(),                                     #Remove minor grid lines
        panel.border = element_blank(),                                         #Remove panel border
        axis.line = element_line(colour = "black")) +                           #Set colour of axis lines
  
  # Manage plot labels and legends
  labs(
    title = "Histogram of Average salary of all Companies",
    subtitle = "For comapnies only rated for Job Security",
    x = "Average salary (€)",
    y = "Companies count",
    caption = "Slight skew to the right, meaning there are more companies with lower average salary") +
  
  # Setting up the aesthetic of the graph
  theme(plot.title = element_text(hjust = 0.1, face = "bold.italic"),
        plot.subtitle = element_text(hjust = 0.1, face = "italic"),
        plot.caption = element_text(hjust = 0, face = 'italic'),
        axis.text = element_text(size = 10, face = "italic"),
        axis.title = element_text(size = 12, face = "bold.italic"))


# Save plot -------------------------------------
ggsave("histogram.png", width = 30, height = 20, units = "cm")                  # Saving the plot as a png file
hist                                                                            # Show the histogram