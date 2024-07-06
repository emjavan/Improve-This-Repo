

#/////////////////////////
#### NEDOCS FUNCTIONS ####
#/////////////////////////

# Suppose you googled for the National Emergency Department Overcrowding Scale (NEDOCS) score formula.
# You could maybe visually tell what is wrong with the old formula.
# This function has the correct formula for the NEDOCS score, but we can do a lot better.
calc_NEDOCS_w_letters = function(a, b, c, d, e, f, g) {
  nedocs = 85.8 * (c/a) + 600 * (f/b) + 13.4 * (d) + 0.93 * (e) + 5.64 * (g) - 20
  return(nedocs)
} # end calc_NEDOCS_w_letters

# Future you appreciates when you write real words and so do people who will use this without you there ####


#///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
#' Function to calculate the National Emergency Department Overcrowding Scale (NEDOCS) score
#' See for Weiss et al. 2004 for derivation - https://pubmed.ncbi.nlm.nih.gov/14709427/
#' Gives us an estimate of how crowded an emergency department is, although this formula has some issues
#' See here for issues https://www.mdcalc.com/calc/3143/nedocs-score-emergency-department-overcrowding#pearls-pitfalls
#' 
#' @param total_ed_beds non-negative integer, total number of ED beds available, including hallways/chairs
#' @param total_inpatient_beds non-negative integer, total number of inpatient beds, excluding pediatric/obstetric
#' @param total_patients_in_ed non-negative integer, total number of ED patients, including hallways/chairs/admissions/waiting room
#' @param total_in_critcalcare non-negative integer, total number of critical care patients in ED (1:1, ventilators, psych, ICU)
#' @param longest_ed_admit_hrs non-negative double, longest admission time waiting in the ED; 15min increments, e.g. 2.25=2 1/4 hr
#' @param total_admits_waiting_in_ed non-negative integer, total number of ED admissions waiting in the ED to go to an inpatient bed
#' @param last_door_to_bed_hrs non-negative double, door-to-bed time for the last ED patient to get an ED bed; 15min increments
#' 
#' @returns integer, NEDOCS score ranges from 0 to 200+, anything over 180 is a disaster
#' 
#' @example Solutions/run_functions.R
#'
calc_NEDOCS_fixed_w_words <- function(
    total_ed_beds,              # a
    total_inpatient_beds,       # b
    total_patients_in_ed,       # c
    total_in_critcalcare,       # d
    longest_ed_admit_hrs,       # e
    total_admits_waiting_in_ed, # f
    last_door_to_bed_hrs        # g
  ){
  # estimate the overcrowding of an emergency room with the NEDOCS score
  nedocs = 
    85.8 * (total_patients_in_ed / total_ed_beds) +
     600 * (total_admits_waiting_in_ed / total_inpatient_beds) +
   (13.4 * total_in_critcalcare) +
   (0.93 * longest_ed_admit_hrs) +
   (5.64 * last_door_to_bed_hrs) -
   20
  
  ic("You're in verbose mode")
  ic(nedocs) # print the nedocs score to screen
  
  nedocs_round = round(nedocs, 0) # round to whole number
  ic(nedocs_round)
  
  return(nedocs_round) # round/ceiling/floor would all be fine, but return a whole number
} # end calc_NEDOCS_fixed_w_words


# There are some perks to squishy/compact code ####
#  more lines is easier to comment things out quickly when debugging 
# You'll see when running lintr all the things it does and doesn't like in the code
# We're not running the function inside this script
#  we want to load and use functions when needed
#  not run a bunch of fake examples that should be tests anyways
