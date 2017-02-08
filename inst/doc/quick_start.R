## ----example-------------------------------------------------------------
## load the package
library(foghorn)

## ----graphical-interface-------------------------------------------------
## Graphical interface
summary_cran_results(email = "francois.michonneau@gmail.com")

## ----tibble--------------------------------------------------------------
## Summary as a tibble
check_cran_results(email = "francois.michonneau@gmail.com")

## ----package-name--------------------------------------------------------
## either by themselves
summary_cran_results(pkg = c("ggplot2", "dplyr"))
check_cran_results(pkg = c("ggplot2", "dplyr"))

## or by combining them with email addresses
summary_cran_results(email = "francois.michonneau@gmail.com",
                     pkg = c("mregions", "ridigbio"))
check_cran_results(email = "francois.michonneau@gmail.com",
                   pkg = c("mregions", "ridigbio"))

## ----show-cran-results---------------------------------------------------
show_cran_results(pkg = "tidyr")

## ----show-cran-db--------------------------------------------------------
check_cran_results(pkg = "nlme", src = "crandb")

