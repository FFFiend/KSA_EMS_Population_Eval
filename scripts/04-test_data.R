#### Preamble ####
# Purpose: download data
# Author: Owais Zahid
# Date: 18th April 2024
# Contact: owais.zahid@mail.utoronto.ca
# License: MIT
# Pre-requisites: run code inside download_data.R

# load in the data from the parquet file
data = read_parquet("~/KSA_EMS_Population_Eval/data/pdata.parquet",sep=",",row.names=1)
data <- data[, c("Gender", "Education", "health_professions", "Called_EMS")]


# Test for Gender column
unique_genders <- unique(data$Gender)
if (length(unique_genders) == 2) {
  print("Gender column contains only 'Male' and 'Female'.")
} else {
  print("Error: Gender column contains invalid values.")
}

# Test for Health Professions column
if (all(data$health_professions %in% c(TRUE, FALSE))) {
  print("Health Professions column contains valid values.")
} else {
  print("Error: Health Professions column contains invalid values.")
}

# Test for Education column
if (all(data$Education %in% c(1,2,3,4,5,6))) {
  print("Education column contains valid values.")
} else {
  print("Error: Education column contains invalid values.")
}

