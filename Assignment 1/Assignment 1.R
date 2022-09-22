# Problem 2 ----


library(tidyverse)
library(readr)


raw_file <- read.delim("suites_dw_Table1.txt")

substr(x = raw_file[,1], start = 1, stop = 2)

L <- 
  (substr(x = raw_file[,1], start = 1, stop = 2) == "--") %>% 
  which() %>% 
  min()


cat(raw_file[1:(L-2),], sep = "\n", file = "Variable desc.")

variable_names <- 
  str_split(string = raw_file[(L-1),], pattern = "\\|") %>% 
  unlist() %>% 
  str_trim()

comma_separated_values <- 
  raw_file[(L+1):nrow(raw_file),] %>% 
  gsub("\\|", ",", .) %>% 
  gsub(" ", "", .)

comma_separated_values_with_names <- 
  c(paste(variable_names, collapse = ","),
    comma_separated_values)

cat(comma_separated_values_with_names, sep = "\n", file = "variable names.csv")

galaxies <- read_csv("variable names.csv")







