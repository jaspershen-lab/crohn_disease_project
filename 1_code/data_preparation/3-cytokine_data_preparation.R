library(r4projects)
setwd(get_project_wd())
rm(list = ls())

source('1-code/100-tools.R')

load("3-data_analysis/1-data_preparation/1-phenotype/phenotype_data.rda")

cytokine_data <-
  readxl::read_xlsx("2-data/cytokine/NULISA_results.xlsx")

dir.create(
  "3-data_analysis/1-data_preparation/3-cytokine",
  showWarnings = FALSE,
  recursive = TRUE
)
setwd("3-data_analysis/1-data_preparation/3-cytokine")

variable_info <-
  cytokine_data %>%
  dplyr::select(targetName) %>% 
  as.data.frame() %>% 
  dplyr::rename(variable_id = targetName)

expression_data <-
  cytokine_data %>% 
  as.data.frame() %>% 
  tibble::column_to_rownames("targetName") 

sample_info <-
  data.frame(sample_id = colnames(expression_data))

sample_info %>% 
  dplyr::left_join(phenotype_data, by = "sample_id")


save(phenotype_data, file = "phenotype_data.rda")
