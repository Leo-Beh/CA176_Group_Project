library(readxl)
library(dplyr)


# Creating the functions --------------------------
unformat_numeric_df <- function(df, column_names) {
  # Takes in a column and unformatting the k values into numeric 1000s
  for (col_name in column_names) {                                              # Loop through every given column
    formatted_input <- numeric(nrow(df))                                        # Empty vector to store formatted value
    
    for (i in seq_along(df[[col_name]])) {                                      # Loop through every element in the column
      
      element <- df[[col_name]][i]                                              # Setting the current element using the index i
      
      if (element == "--") {                                                    # Checking and unformatting the value k and then multiplying it by 1000 if it contains a 'k'
        formatted_input[i] <- NA
      } else if (grepl("k", element, fixed = TRUE)) {
        unformat <- gsub("k", "", element)
        formatted_input[i] <- as.numeric(unformat) * 1000
      } else {
        formatted_input[i] <- as.numeric(element)
      }
    }
    
    new_col_name <- paste0(col_name, "_")                                       # Adding unformatted values into dataframe as a new column
    df[[new_col_name]] <- formatted_input
  }
  
  return(df)
}


extract_industry <- function(description) {
  # Extracting the industries from the description column
  parts <- strsplit(description, "\\|")[[1]]                                    # Split description on "|"
  
  industry <- trimws(parts[1])                                                  # Take the first part and trim whitespace
  
  if (grepl("^[A-Za-z &]+$", industry)) {                                       # Check if the first part contains only letters using regex
    return(industry)
  } else {
    return(NA)                                                                  # Return null if the first part contains non-letter characters
  }
}


# Running the functions ------------------------------
underscore_unformatted_companies_df <- unformat_numeric_df(companies_df, c("Avg_salary", "Interviews_taken", "Total_jobs_available", "Total_reviews", "Total_benefits"))
underscore_unformatted_companies_df$Industry <- sapply(underscore_unformatted_companies_df$Description, extract_industry)
View(underscore_unformatted_companies_df)

# Saving the program ---------------------------------
save(underscore_unformatted_companies_df, file = "underscore_unformat_k.rdata") # Saving the file as r binary data