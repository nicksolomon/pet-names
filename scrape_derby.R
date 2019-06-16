library(rvest)
library(tidyverse)
library(janitor)

derby_roll_call <- read_html("https://www.twoevils.org/rollergirls/")

names_raw <- derby_roll_call %>% 
  html_node("table") %>% 
  html_table(header = TRUE, trim = TRUE, fill = TRUE)

names <- names_raw[3:nrow(names_raw), 1:4]
names(names) <- names_raw[2, 1:4]
names <- clean_names(names)

write_csv(names, "derby_names.csv")

