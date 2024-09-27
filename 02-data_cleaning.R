#### Preamble ####
# Purpose: Cleans the raw marriage data into an analysis dataset
# Author: Claire Chang
# Date: 19 September 2024
# Contact: Claire.chang@mail.utoronto.ca
# License: MIT
# Pre-requisites: Need to have downloaded the data
# Any other information needed? None.
#### Workspace setup ####
library(tidyverse)

#### Clean data ####
raw_data <- read_csv("data/raw_data/raw_data.csv")

# Clean and process data
cleaned_data <- raw_data |>
  janitor::clean_names() |>  # Standardize column names
  select(occ_date, occ_year, occ_month, occ_dow, occ_hour, occ_time_range, death, injuries, neighbourhood_158) |>  # Select relevant columns
  mutate(
    # Replace NA values in 'death' and 'injuries' columns with 0
    death = replace_na(death, 0),
    injuries = replace_na(injuries, 0),
    
    # Convert columns to numeric if necessary
    death = as.numeric(death),
    injuries = as.numeric(injuries),
    occ_hour = as.numeric(occ_hour)
  ) |>
  tidyr::drop_na()  # Remove rows with remaining missing values

#### Save cleaned data ####
write_csv(cleaned_data, "data/analysis_data/analysis_data.csv")



