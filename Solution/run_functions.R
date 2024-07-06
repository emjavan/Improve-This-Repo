#///////////////////////////////////////////////////////////////
# Improved NEDOCS score calculation and function testing ####
# Note: any line with 4 # after it shows up in R studio outline
#  the leading # control the nestedness of these headers
#///////////////////////////////////////////////////////////////

#//////////////////////////////////
#### SOURCE FILES AND PACKAGES ####
#//////////////////////////////////
source("Solution/getload_needed_packages.R") # download all the packages needed
source("Solution/improved_calc_nedocs.R") # load the functions we'll use

cute=F 
if(cute==F){ # this is more logical and gives helpful output when debugging
  testthat::test_file("Solution/test_functions.R") # test the functions once loaded
}else{ # this way gives cute emojis for all your passed tests
  source("Solution/test_functions.R")
} # end if want cute output or not

#/////////////////////
#### VERBOSE MODE ####
#/////////////////////
# verbose mode is commonly used when debugging, usually the -v option on command line
# we can replicate that with the icecream package by enabling and disabling print statements
verbose=T # ic_enable is the default when you first load the package, but better to be explicit
if(verbose == TRUE){
  icecream::ic_enable()
}else{
  icecream::ic_disable()
} # end if in verbose mode

#////////////////////
#### RUN EXAMPLE ####
#////////////////////
set.seed(333) # For reproducibility
example_df = data.frame(
  total_ed_beds = seq(10, 100, length.out = 10),
  total_inpatient_beds = seq(100, 1000, length.out = 10),
  total_patients_in_ed = seq(1, 50, length.out = 10),
  total_in_critcalcare = seq(0, 10, length.out = 10),
  longest_ed_admit_hrs = seq(0, 10, length.out = 10),
  total_admits_waiting_in_ed = seq(0, 20, length.out = 10),
  last_door_to_bed_hrs = seq(0, 5, length.out = 10)
)
example_df = floor(example_df) # make all the numbers integers, even though time data can be real

# Calculate the NEDOCS score for each row
example_df_w_nedocs = example_df %>%
  mutate(nedocs_score = calc_NEDOCS_fixed_w_words(
    total_ed_beds,
    total_inpatient_beds,
    total_patients_in_ed,
    total_in_critcalcare,
    longest_ed_admit_hrs,
    total_admits_waiting_in_ed,
    last_door_to_bed_hrs
  ))

#//////////////////////////////
#### MEASURE CODE COVERAGE ####
#//////////////////////////////
# Re-runs your test as if cute=T, so benefit of more happy celebration emojis
# We're aiming for 100% coverage, so what function still needs a test written???
covr::file_coverage(
  source_files="Solution/improved_calc_nedocs.R",
  test_files="Solution/test_functions.R",
  parent_env = parent.frame()
)

#////////////////////////////////////////
#### EVALUATE CODE STYLE CONSISTENCY ####
#////////////////////////////////////////
if(!file.exists(".lintr")){
  lintr::use_lintr(type = "tidyverse")
}

lintr::lint_dir()
