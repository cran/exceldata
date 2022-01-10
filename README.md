
<!-- README.md is generated from README.Rmd. Please edit that file -->

# exceldata

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
<!--[![CRAN status](https://www.r-pkg.org/badges/version/exceldata)](https://CRAN.R-project.org/package=exceldata)-->
<!-- badges: end -->

The goal of exceldata is to facilitate the use of Excel as a data entry
tool for reproducible research. This package provides tools to automate
data cleaning and recoding of data by requiring a data dictionary to
accompany the Excel data. A macro-enabled template file has been created
to facilitate clean data entry including validation rules for live data
checking.

To download the Excel Template [Click
Here](https://github.com/biostatsPMH/exceldata/blob/main/images/DataDictionary0.9.1.xlsm)
and then click on `Download`

To view data in the required format without macros [Click
Here](https://github.com/biostatsPMH/exceldata/blob/main/inst/extdata/exampleData.xlsx)
and then click on `Download`

## Installation

<!--You can install the released version of PDstats from [CRAN](https://CRAN.R-project.org) with:

``` r
install.packages("PDstats")
```

And the development version from [GitHub](https://github.com/) with:
-->

You can install the development version of the package from GitHub with:

``` r
`devtools::install_github("biostatsPMH/exceldata")`
```

------------------------------------------------------------------------

## Documentation

[Online Documentation For Excel
Users](https://biostatspmh.github.io/exceldata/information-for-users-of-the-data-dictionary.html)

PDF Documentation: [Click
Here](https://github.com/biostatsPMH/exceldata/blob/main/docs/ExcelDictionaryUserManual.pdf)
and then click on `Download`
<!-- Note - this is created in a separate directory - Teaching/excelData Instructions -->

[For Biostatisticians](https://biostatspmh.github.io/exceldata/)

## Example

Example of importing the data and producing univariate plots to screen
for outliers.

``` r
library(exceldata)

exampleDataFile <- system.file("extdata", "exampleData.xlsx", package = "exceldata")
import <- importExcelData(exampleDataFile,dictionarySheet = 'DataDictionary',dataSheet = 'DataEntry')
#> File import complete. Details of variables created are in the logfile:  exampleData06Jan22.log

# The imported data dictionary 
dictionary <- import$dictionary
head(dictionary)
#> # A tibble: 6 x 6
#>   VariableName Description                Type      Minimum    Maximum Levels   
#>   <chr>        <chr>                      <chr>     <chr>      <chr>   <chr>    
#> 1 ID           unique patient identifier  character <NA>       <NA>    <NA>     
#> 2 Age          Patient's age at diagnosis numeric   40         110     <NA>     
#> 3 Gender       Patient's gender           category  <NA>       <NA>    m=Male,f~
#> 4 T_Stage      Tumour Staging             category  <NA>       <NA>    T0,T1,T2~
#> 5 DxDate       Date of Diagnosis          date      2019-01-01 today   <NA>     
#> 6 ECOG         Performance Status         integer   0          5       <NA>

# The imported data, with calculated variables
data <- import$data
head(data)
#> # A tibble: 6 x 9
#>   ID      Age Gender T_Stage DxDate      ECOG Date_Death Date_LFU   T0_Stg
#>   <chr> <dbl> <fct>  <fct>   <date>     <int> <date>     <date>     <fct> 
#> 1 1        77 f      T2      2019-06-05     4 2021-08-06 NA         T1up  
#> 2 2        58 f      T2      2019-09-26     2 2020-06-06 NA         T1up  
#> 3 3        66 f      T4      2019-07-19     0 NA         2020-07-20 T1up  
#> 4 4        72 f      T4      2019-12-17     4 NA         2021-07-04 T1up  
#> 5 5        52 f      T2      2019-06-07     1 2020-12-04 NA         T1up  
#> 6 6        72 f      T1      2021-02-10     2 2021-10-10 NA         T1up

# Simple univariate plots with outliers 
plots <- plotVariables(data,dictionary,IDvar = 'ID',showOutliers = T)
# Not Run: Show plots in viewer
# plots
```
