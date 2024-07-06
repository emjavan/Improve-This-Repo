#//////////////////////////////////////////////////////////////////////////////////////////////
# Tests using the testthat package written by ChatGPT 
# As a researcher you don't need to waste time on really simple unit tests
# Use a tool like ChatGPT when you're in a hurry, something is better than nothing
# Example prompt: "Can you write 3 unit tests for this function using R testthat and tidyverse"
#//////////////////////////////////////////////////////////////////////////////////////////////

# Test 1: Normal case
test_that("calc_NEDOCS_fixed_w_words calculates correctly for normal values", {
  result <- calc_NEDOCS_fixed_w_words(
    total_ed_beds = 10,
    total_inpatient_beds = 100,
    total_patients_in_ed = 50,
    total_in_critcalcare = 2,
    longest_ed_admit_hrs = 5,
    total_admits_waiting_in_ed = 10,
    last_door_to_bed_hrs = 3
  )
  expected = 85.8 * (50 / 10) + 600 * (10 / 100) + (13.4 * 2) + (0.93 * 5) + (5.64 * 3) - 20
  expected = round(expected, 0)
  expect_equal(result, expected)
})

# Test 2: Edge case with zero values
test_that("calc_NEDOCS_fixed_w_words handles zero values correctly", {
  result <- calc_NEDOCS_fixed_w_words(
    total_ed_beds = 1,  # Avoid division by zero
    total_inpatient_beds = 1,  # Avoid division by zero
    total_patients_in_ed = 0,
    total_in_critcalcare = 0,
    longest_ed_admit_hrs = 0,
    total_admits_waiting_in_ed = 0,
    last_door_to_bed_hrs = 0
  )
  expected <- 85.8 * (0 / 1) + 600 * (0 / 1) + 13.4 * 0 + 0.93 * 0 + 5.64 * 0 - 20
  expected = round(expected, 0)
  expect_equal(result, expected)
})

# Test 3: Case with high values
test_that("calc_NEDOCS_fixed_w_words calculates correctly for high values", {
  result <- calc_NEDOCS_fixed_w_words(
    total_ed_beds = 100,
    total_inpatient_beds = 1000,
    total_patients_in_ed = 500,
    total_in_critcalcare = 20,
    longest_ed_admit_hrs = 50,
    total_admits_waiting_in_ed = 100,
    last_door_to_bed_hrs = 30
  )
  expected <- 85.8 * (500 / 100) + 600 * (100 / 1000) + 13.4 * 20 + 0.93 * 50 + 5.64 * 30 - 20
  expected = round(expected, 0)
  expect_equal(result, expected)
})
