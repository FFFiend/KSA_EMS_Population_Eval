#### Preamble ####
# Purpose: download data
# Author: Owais Zahid
# Date: 18th April 2024
# Contact: owais.zahid@mail.utoronto.ca
# License: MIT
# Pre-requisites: None


### IMPORTANT NOTE###
# PLEASE download the dataset directly from source, and convert it to an RData file inside
# RStudio. Simply downloading the excel file and reading or converting it leads to issues
# due to arabic being present in one of the columns. The excel file can be found here:
# https://dataverse.harvard.edu/dataset.xhtml?persistentId=doi:10.7910/DVN/BPVQET 

library(knitr)
library(arrow)

# load data in from RData file
data <- load("data/processed_data.RData")

# write to a parquet
write_parquet(raw_data, "data/pdata.parquet")

# read from parquet
data = read_parquet("data/pdata.parquet",sep=",",row.names=1)

# show first 10 entries
head(data,n=10)
