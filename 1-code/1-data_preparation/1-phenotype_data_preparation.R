library(r4projects)
setwd(get_project_wd())
rm(list = ls())

source('1-code/100-tools.R')

readxl::read_xlsx("2-data/demographics_data/52995ExposomeConsent_DATA_2024-02-21_1517.csv")

phenotype_data <-
  readr::read_csv("2-data/demographics_data/52995ExposomeConsent_DATA_2024-02-21_1517.csv")

phenotype_data <-
phenotype_data %>% 
  dplyr::rename(subject_id = record_id)

dir.create(
  "3-data_analysis/1-data_preparation/1-phenotype",
  showWarnings = FALSE,
  recursive = TRUE
)
setwd("3-data_analysis/1-data_preparation/1-phenotype")

save(phenotype_data, file = "phenotype_data.rda")
