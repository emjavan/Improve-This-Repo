#/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
# The below code is an example script someone might send you with bugs.
# What isn't useful about this code, given you're likely unfamiliar with NEDOCS score?

# 1. The letters as variable names are useless. They should be unambiguous words humans read.
# 2. There is not enough information here on what types of inputs this function takes.
#  Is it appropriate to pass a=0.5, negative, 0? It's not in the example but nothing preventing/warning us.
# 3. Looks like we're returning a number but nothing to signal what an appropriate range of the output is.
# 4. Little to no comments that are adding anything new/useful. "cals_NEDOCS" function name and the comment 
#  "calculate the nedocs score" is saying the same thing.
# 5. Nice we have a readme file for the repo, but it just directs you to an online calculator you could compare with.
#  But without reading some other documentation you don't know what letter is what input in the calculator.
# 6.... what else would like to fix? 
#/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

library(tidyverse)

# calculate the nedocs score
calc_NEDOCS = function(a, b, c, d, e, f, g){
  nedocs = 85.8 * (c/a) + 600 * (f/d) + 13.4 * (b) + 0.93 * (e) + 5.64 * (g) + 20
  return(nedocs)
}

test_df = df <- data.frame(
  a = c(1, 20, 30, 40, 50),
  b = c(1,  2,  3,  4,  5),
  c = c(0,  5, 10, 15, 20),
  d = c(0,  4,  6,  8, 10),
  e = c(0,  6,  9, 12, 15),
  f = c(0,  8, 12, 16, 20),
  g = c(0, 14, 21, 28, 35)
)

test_fun_df = test_df %>%
  mutate(nedocs = calc_NEDOCS(a, b, c, d, e, f, g))

