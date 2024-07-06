# Improve-This-Repo

This is an example of R code where we need some improvements. The single script provided calculates the [NEDOCS score](https://www.mdcalc.com/calc/3143/nedocs-score-emergency-department-overcrowding) of an emergency room to estimate the level of overcrowding. The code intentionally has bugs introduced that you should try to detect and fix by implementing some of the options below. My solution will be available in the `Solution` directory. I recommend you 1) fork this repo 2) open the .Rproj and take a look at the R script `calc_NEDOCS.R` 3) think about what makes this code difficult to use. For example, if you didn't know this code was buggy, how long would it take you to figure that out? Has the author provided any way for you to confirm the formula is correct outside of googling for yourself? 

## Useful Packages

**Table 1** Packages in R and Python to consider using to improve your code.
| Tool Use       | R           | Python  |
| ------------- |:-------------:| :-----:|
| Document function inputs/outputs/use      | [roxygen2](https://r-pkgs.org/man.html) | Hints |
| Track code updates | git/GitHub      |    git/GitHub | 
| Better debugging than print statements | [icecream](https://www.r-bloggers.com/2022/07/ice-cream-for-r-programmers/) | icecream |
| Run unit test | [testthat](https://testthat.r-lib.org/) | pyunit |
| Run tests on an action, e.g. every push | GitHub Actions | GitHub Actions | 
| Measure code being tested for bugs | [covr](https://cran.r-project.org/web/packages/covr/vignettes/how_it_works.html) | pytest |
| Confirm code consistency     | [lintr](https://lintr.r-lib.org/)     |   pylint |

I won't use each tool in the solution, but they're all at your disposal and worth bringing into your big projects with multiple users or even when the users are just you sleep and without sleep.

If you want to really dig into better code design I recommend [this course](https://coe-332-sp22.readthedocs.io/en/main/index.html). The Texas Advanced Computing Center offers tutorials of different chapters to users, but they'll cover a lot in a few hours. I recommend you work the course at the pace you can learn and apply the concepts to your research and take their tutorials when offered to ask questions.
