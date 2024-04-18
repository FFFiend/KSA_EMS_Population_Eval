#### Preamble ####
# Purpose: Simulate the dataset
# Author: Owais Zahid
# Date: 18th April 2024
# Contact: owais.zahid@mail.utoronto.ca
# License: MIT
# Pre-requisites: None

# Set seed for reproducibility
set.seed(123)

# Number of observations
n <- 1000

# Simulate Gender (0 = male, 1 = female)
Gender <- sample(0:1, n, replace = TRUE)

# Simulate Education (e.g., 1 = high school, 2 = bachelor's degree, 3 = master's degree, 4 = doctorate)
Education <- sample(1:4, n, replace = TRUE)

# Simulate health_profession (0 = not in health profession, 1 = in health profession)
health_profession <- sample(0:1, n, replace = TRUE)

# Define logistic function
logistic_function <- function(Gender, Education, health_profession, intercept, gender_coef, education_coef, profession_coef) {
  log_odds <- intercept + gender_coef * Gender + education_coef * Education + profession_coef * health_profession
  probability <- exp(log_odds) / (1 + exp(log_odds))
  return(probability)
}

# Simulate Called_EMS based on the logistic function
intercept <- -0.284
gender_coef <- 0.143
education_coef <- -0.535
profession_coef <- 1.094

Called_EMS_prob <- logistic_function(Gender, Education, health_profession, intercept, gender_coef, education_coef, profession_coef)
Called_EMS <- rbinom(n, 1, Called_EMS_prob)

# Create dataframe
simulated_data <- data.frame(Gender, Education, health_profession, Called_EMS)

# Display the first few rows of the simulated dataset
head(simulated_data)

