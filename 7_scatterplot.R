library(readxl)
library(dplyr)
library(ggplot2)


# Load graph ------------------------------------
ggplot(data = underscore_unformatted_companies_df, aes(x = Avg_salary_, y = Ratings)) +        # Creating a scatter-plot with "Avg_salary" in x-axis and "Ratings" in y-axis
  geom_point(aes(color = Ratings), shape =16 , alpha = 0.7) +                   # Setting up the aesthetic of the points
  stat_density2d(aes(alpha = ..density..), geom = "tile", contour = FALSE) +    # Shows the density of all the companies 
  scale_color_gradient(low = "yellow", high = "#D22B2B") +                      # Scale the point colours base on their "Ratings"
  theme_bw() +                                                                  # Setting up a black and white background
  
  # Manage plot labels and legends
  labs(
    title = "Scatter Plot of Avg Salary vs Ratings",
    subtitle = "Of all comapnies available",
    x = "Average Salary",
    y = "Ratings",
    caption = "Most companies lies within an average salary of 700-100\nwith a rating of 3.8-4.2") +
  
  # Scale x and y axis
  scale_x_continuous(labels = scales::comma,
                     trans = "log10") +                                         # Scale x exponentially and label the results using comma
  scale_y_continuous(
    limits = c(1, 5),
    breaks = seq(1, 5),
    labels = c("1 Very Poor", "2 Poor", "3 Fair", "4 Good", "5 Very Good")                                # Scale y base on the the values of "Ratings"
  ) +
  
  # Setting up the aesthetic of the graph 
  theme(plot.title = element_text(hjust = 0.5, face = "bold.italic"),
        plot.subtitle = element_text(hjust = 0.5, face = "italic"),
        plot.caption = element_text(hjust = 0, face = 'italic'),
        legend.position = "right",
        axis.text = element_text(size = 10, face = "italic"),
        axis.title = element_text(size = 12, face = "bold.italic"))

ggsave("scatter_plot.png", width = 7, height = 5)