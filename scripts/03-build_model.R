#### Preamble ####
# Purpose: building the model
# Author: Owais Zahid
# Date: 18th April 2024
# Contact: owais.zahid@mail.utoronto.ca
# License: MIT
# Pre-requisites: follow instructions and run code inside download_data.R

# load libraries 
library(knitr)
library(arrow)
library(rstanarm)
library(modelsummary)

# read data into a dataframe.
data = read_parquet("~/KSA_EMS_Population_Eval/data/pdata.parquet",sep=",",row.names=1)
new_data <- data[, c("Gender", "Education", "health_professions", "Called_EMS")]

# set seed
set.seed(71)

# construct model and use suitable means for coefficient priors
model <- stan_glm(
  Called_EMS ~ Gender + Education + health_professions,
  data = new_data,
  family = binomial(link = "logit"),
  prior = normal(location = c(1, 3, 0), scale = c(2.5, 2.5, 2.5)),
  prior_intercept = 
    normal(location = 0, scale = 2.5, autoscale = TRUE),
  seed = 71  )

# save model into rds file
saveRDS(
  model,
  file = "~/KSA_EMS_Population_Eval/model/model.rds"
)

# read model from file
model <-
  readRDS(file = "~/KSA_EMS_Population_Eval/model/model.rds")
modelsummary::modelsummary(model)
