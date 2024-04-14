library(readxl)
library(dplyr)
library(ggplot2)


Q6_frequency <- proportion_cal(aspect_and_frquency)

#Get the value of the NA aspect
NAValue <- (Q6_frequency[1, 'Proportions'])


#Remove the NA aspect row from the data frame
Q6_frequency <- Q6_frequency[Q6_frequency$Aspect != 'NA',]

#Get the sum of the reaming proportions the recalculate their percentages
remainingProportion <- sum(Q6_frequency$Proportions)

#Change proportions to percentages
ReaminingPercentage <- remainingProportion * 100
NAPercentage <- NAValue * 100

#Readjust percentages
adjustmentFactor <- NAPercentage / ReaminingPercentage


#Order the data from from highest to lowest in terms of proportions
Q6_frequency <- Q6_frequency[order(-Q6_frequency$Proportions), ]


#Get the top 5 rows in terms of their proportions of aspects
Q6_frequency <- head(Q6_frequency, 5)


Q6_Proportions <- Q6_frequency$Proportions
Q6_Proportions <- Q6_Proportions * 100
Q6_Proportions <- Q6_Proportions * adjustmentFactor
Q6_Proportions <- round(Q6_Proportions, digits = 2)
Q6_Proportions <- paste0(Q6_Proportions, "%")

newProportions <- (Q6_frequency[3] * adjustmentFactor) * 100
Q6_frequency$Proportions <- newProportions
View(Q6_frequency)

bar_plot <- ggplot(data = Q6_frequency, aes(x = Aspect, y = Proportions$Proportions)) +
  geom_bar(stat = "identity", width = 0.5, fill = "skyblue") +
  geom_text(aes(label = Q6_Proportions), vjust = -0.3, color = "black", size = 4) +
  labs(
    title = "Bar chart of  Aspects rated for vs Proportions",
    subtitle = "For comapnies only rated for Job Security",
    x = "Aspects rated for",
    y = "Proportions",
    caption = "As shown on the graph Promations/Appraisal is clearly on of the main aspects in which compainies get rated for") +
  
  ## Setting up the aesthetic of the graph
  theme(plot.title = element_text(hjust = 0.5, face = "bold.italic"),
        plot.subtitle = element_text(hjust = 0.5, face = "italic"),
        plot.caption = element_text(hjust = 0, face = 'italic'),
        legend.position = "right",
        axis.text.x = element_text(angle = 45, hjust = 1, size = 10), #Rotate and adjust font size of x-axis labels
        axis.text = element_text(size = 10, face = "italic"),
        panel.grid.major = element_blank(), #Remove major grid lines
        panel.grid.minor = element_blank(), #Remove minor grid lines
        panel.border = element_blank(), #Remove panel border
        axis.title = element_text(size = 12, face = "bold.italic"))

print(bar_plot)
