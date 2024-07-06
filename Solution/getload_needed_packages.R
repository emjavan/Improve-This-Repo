
# Packages your user needs to run this code
# Take guess work out whenever possible

if (!require("pacman")) install.packages("pacman") # for pacman::p_load

pacman::p_load(tidyverse, icecream, testthat, covr, lintr)

ic(p_loaded())
