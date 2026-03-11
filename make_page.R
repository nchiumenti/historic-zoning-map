################################################################################
#' File name:     make_page.R
#'
#' Description:   < description here >
#'
#' Inputs:        < input files here >
#'
#' Outputs:       < output files here >
#'
#' Author:        Nicholas Chiumenti  
#'
#' Date created:  2026-03-11
#' 
#' Last updated:  2026-03-11
################################################################################

rm(list = ls())
gc()

set.seed(1234) 
options(scipen = 999)

# load packages
library(tidyverse)

# get/set paths
getwd()

regex_pattern <- "([A-Za-z]+)-([0-9][0-9][0-9][0-9]).png$"

f_list <- list.files("./maps/png/",pattern = ".png$")

for (f in f_list) {
  
  #print(f)
  
  muni <- stringr::str_extract(f, pattern = regex_pattern, group = 1)
  
  muni_cap <- stringr::str_to_title(muni)
  
  year <- stringr::str_extract(f, pattern = regex_pattern, group = 2)
  
  f_path <- stringr::str_glue("../maps/png/{muni_cap}-{year}.png")
  
  alphabet <- str_sub(muni_cap, 1, 1)
  
  # print(muni)
  # print(muni_cap)
  # print(year)
  # print(f_path)
  # print(alphabet)
  # print("")
  
  q <- stringr::str_glue("---
  title: {muni_cap}, {year}
  image: {f_path}
  description: {muni_cap}, Massachusetts
  author: Nicholas Chiumenti
  date: {Sys.Date()}
  categories: [{year}, {alphabet}]
  format:
    html:
      page-layout: full
  ---
  
  ![]({f_path}){{.lightbox}}")
  
  print(x)
  
  out_file <- stringr::str_glue("./pages/{muni}-{year}.qmd")
  
  write_lines(q, file = out_file)
  
}
