#### Preamble ####
# Purpose: Simulates data
# Author: Claire Chang
# Date: 19 September 2024
# Contact: Claire.chang@mail.utoronto.ca
# License: MIT
# Pre-requisites: None
# Any other information needed? None


#### Workspace setup ####
library(tidyverse)

# Load necessary libraries
library(tibble)
library(readr)

# Set the number of random events you want to generate
number_of_events <- 100

# Define the time range for the simulated data
start_date <- as.Date("2004-01-01")
end_date <- as.Date("2024-06-30")

# Generate the simulated data
data <- 
  tibble(
    dates = as.Date(
      runif(
        n = number_of_events,
        min = as.numeric(start_date),
        max = as.numeric(end_date)
      ),
      origin = "1970-01-01"
    ),
    hours = sample(0:23, size = number_of_events, replace = TRUE),
    neighborhoods = sample(
      c("Neighborhood A", "Neighborhood B", "Neighborhood C"), 
      size = number_of_events, 
      replace = TRUE
    ),
    deaths = rpois(n = number_of_events, lambda = 0.1),
    injuries = rpois(n = number_of_events, lambda = 0.5)
  )

# Save the simulated data to a CSV file
write_csv(data, file = "data/raw_data/simulated.csv")


