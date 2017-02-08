
<!-- README.md is generated from README.Rmd. Please edit that file -->
[![Travis-CI Build Status](https://travis-ci.org/fmichonneau/foghorn.svg?branch=master)](https://travis-ci.org/fmichonneau/foghorn) [![AppVeyor Build Status](https://ci.appveyor.com/api/projects/status/github/fmichonneau/foghorn?branch=master&svg=true)](https://ci.appveyor.com/project/fmichonneau/foghorn) [![Coverage Status](https://img.shields.io/codecov/c/github/fmichonneau/foghorn/master.svg)](https://codecov.io/github/fmichonneau/foghorn?branch=master) [![](http://www.r-pkg.org/badges/version/foghorn)](http://www.r-pkg.org/pkg/foghorn) [![CRAN RStudio mirror downloads](http://cranlogs.r-pkg.org/badges/foghorn)](http://www.r-pkg.org/pkg/foghorn)

foghorn
=======

> **foghorn** *noun* <br> 1. Device used to facilitate navigation in foggy conditions by warning of potential hazards ahead.

`foghorn` makes accessible to the R terminal the results of the CRAN check results for packages maintained by individuals, or for other package of interests. It provides a graphical summary of the results designed to added to your `.Rprofile` (to check regularly on the status of the published packages), or as a tibble.

As new features are introduced in development versions of R, or new policies are put in place, packages that are not updated frequently may start generating warnings or errors when checked on CRAN's infrastructure. `foghorn` brings this information to your terminal so you don't have to leave the comfort of your terminal to know the results of the CRAN checks for your packages.

Installation
------------

You can install foghorn from github with:

``` r
# install.packages("ghit")
ghit::install_github("fmichonneau/foghorn")
```

Demonstration
-------------

``` r
## load the package
library(foghorn)
```

`foghorn` provides a graphical summary for CRAN check results for the packages maintained by individuals (the number is parentheses indicates the number of R flavors used by CRAN that generate notes, warnings, errors):

``` r
## Graphical interface
summary_cran_results(email = "francois.michonneau@gmail.com")
#> ⚠  Packages with warnings on CRAN: 
#>   - rncl (4)
#>   - rotl (1)
#> ★  Package with notes on CRAN: 
#>   - rncl (2)
```

The information can also be summarized as a table:

``` r
## Summary as a tibble
check_cran_results(email = "francois.michonneau@gmail.com")
#> # A tibble: 4 × 7
#>     Package ERROR  FAIL  WARN  NOTE    OK has_memtest_notes
#>       <chr> <int> <int> <int> <int> <int>             <lgl>
#> 1 phylobase    NA    NA    NA    NA    13             FALSE
#> 2  riceware    NA    NA    NA    NA    13             FALSE
#> 3      rncl    NA    NA     4     2     7             FALSE
#> 4      rotl    NA    NA     1    NA    12             FALSE
```

In addition of your own packages, you can also check the results for other packages that might be of interest to you:

``` r
## either by themselves
summary_cran_results(pkg = c("ggplot2", "dplyr"))
#> ✖  Package with errors on CRAN: 
#>   - ggplot2 (2)
#> ⚠  Packages with warnings on CRAN: 
#>   - dplyr (1)
#>   - ggplot2 (1)
#> ★  Packages with notes on CRAN: 
#>   - dplyr (7)
#>   - ggplot2 (4)
#> ◉  Package with memtest on CRAN: 
#>   - dplyr
check_cran_results(pkg = c("ggplot2", "dplyr"))
#> # A tibble: 2 × 7
#>   Package ERROR  FAIL  WARN  NOTE    OK has_memtest_notes
#>     <chr> <int> <int> <int> <int> <int>             <lgl>
#> 1   dplyr    NA    NA     1     7     5              TRUE
#> 2 ggplot2     2    NA     1     4     6             FALSE

## or by combining them with email addresses
summary_cran_results(email = "francois.michonneau@gmail.com",
                     pkg = c("mregions", "ridigbio"))
#> ⚠  Packages with warnings on CRAN: 
#>   - rncl (4)
#>   - rotl (1)
#> ★  Packages with notes on CRAN: 
#>   - mregions (1)
#>   - rncl (2)
check_cran_results(email = "francois.michonneau@gmail.com",
                   pkg = c("mregions", "ridigbio"))
#> # A tibble: 6 × 7
#>     Package ERROR  FAIL  WARN  NOTE    OK has_memtest_notes
#>       <chr> <int> <int> <int> <int> <int>             <lgl>
#> 1  mregions    NA    NA    NA     1    12             FALSE
#> 2  ridigbio    NA    NA    NA    NA    13             FALSE
#> 3 phylobase    NA    NA    NA    NA    13             FALSE
#> 4  riceware    NA    NA    NA    NA    13             FALSE
#> 5      rncl    NA    NA     4     2     7             FALSE
#> 6      rotl    NA    NA     1    NA    12             FALSE
```

You can also inspect the logs for the check results using `show_cran_results(pkg)`, while `visit_cran_check(pkg)` takes you to the CRAN webpage.

``` r
show_cran_results(pkg = "tidyr")
#> ★ tidyr - NOTE: data for non-ASCII characters
#>    ❯ r-devel-linux-x86_64-fedora-clang 
#>    ❯ r-devel-linux-x86_64-fedora-gcc 
#>    ❯ r-devel-macos-x86_64-clang 
#> 
#>       Note: found 23 marked UTF-8 strings
#> 
#> ★ tidyr - NOTE: data for non-ASCII characters
#>    ❯ r-patched-solaris-sparc 
#>    ❯ r-patched-solaris-x86 
#>    ❯ r-release-osx-x86_64-mavericks 
#>    ❯ r-oldrel-windows-ix86+x86_64 
#> 
#>       Note: found 23 marked UTF-8 strings
```

Where does it get the data?
---------------------------

The data from the CRAN check results used by this package are either scrapped from the CRAN web pages (default), or are from the CRAN database. The first option is faster if you want to check regularly a few packages. However, if you are doing statistics on a large number of packages, using the CRAN database is recommended. To use the CRAN database, add `src = "crandb"` in your function calls:

``` r
check_cran_results(pkg = "nlme", src = "crandb")
#> # A tibble: 1 × 7
#>   Package ERROR  FAIL  WARN  NOTE    OK has_memtest_notes
#>     <chr> <int> <int> <int> <int> <int>             <lgl>
#> 1    nlme    NA    NA    NA    NA    13             FALSE
```

Check out the "Details" section in the help files for more information.

Feedback? Suggestions?
----------------------

Feel free to submit feedback and suggestions by [opening an issue](https://github.com/fmichonneau/foghorn/issues/new) on GitHub.

Code of Conduct
---------------

Please note that this project is released with a [Contributor Code of Conduct](CONDUCT.md). By participating in this project you agree to abide by its terms.
