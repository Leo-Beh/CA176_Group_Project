#installing the ggplot2 library...
# install.packages("ggplot2")

#Load the ggplot2 library
library(readxl)
library(ggplot2)

#read and load the "companies" dataset into R using a downlaoded clean version
companies_df <- read_excel("companies.xlsx")

#testing that ggplot is installed and loaded...
ggplot(data = companies_df, aes(x = Ratings, y = Total_reviews))
