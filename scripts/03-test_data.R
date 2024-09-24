#### Preamble ####
# Purpose: Sanity check of the data
# Author: Claire Chang
# Date: 19 September 2024
# Contact: Claire.chang@mail.utoronto.ca
# License: MIT
# Pre-requisites: Need to have simulated data
# Any other information needed? None.


#### Workspace setup ####
library(tidyverse)


#### Test data ####
data <- read_csv("data/raw_data/simulated.csv")

# Test for NAs
all(is.na(data$death))






