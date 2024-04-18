library(knitr)
library(arrow)
library(rstanarm)
library(modelsummary)
data = read_parquet("~/KSA_EMS_Population_Eval/data/pdata.parquet",sep=",",row.names=1)
new_data <- data[, c("Gender", "Education", "health_professions", "Called_EMS")]

set.seed(71)

model <- stan_glm(
  Called_EMS ~ Gender + Education + health_professions,
  data = new_data,
  family = binomial(link = "logit"),
  prior = normal(location = c(1, 3, 0), scale = c(2.5, 2.5, 2.5)),
  prior_intercept = 
    normal(location = 0, scale = 2.5, autoscale = TRUE),
  seed = 71  )

saveRDS(
  model,
  file = "~/KSA_EMS_Population_Eval/model/model.rds"
)

model <-
  readRDS(file = "~/KSA_EMS_Population_Eval/model/model.rds")
modelsummary::modelsummary(model)
