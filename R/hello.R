# SF Climate Change Vignette
#
# This program is a demo of data wrangling possibilities in R using
# data from the nearest weather station to my home in Duboce Triangle, SF, CA.
# The National Oceanic and Atmospheric Administration (NOAA)
# National Centers For Environmental Information,
# https://www.ncdc.noaa.gov/cdo-web/datatools allowed local station data
# to be ordered and downloaded.
#
# The first datasets obtained for station USW00023272 were daily summaries
# and hourly precipitation for all time.
#
# R package information can be found at http://r-pkgs.had.co.nz/
# Shortcuts:
#   Build and Reload Package:  'Cmd + Shift + B'
#   Check Package:             'Cmd + Shift + E'
#   Test Package:              'Cmd + Shift + T'

# devtools::use_vignette("Climate Vignette")

#' SF Climate Change
#'
#' @return
#' @export
#'
#' @examples
hello <- function() {
  print("San Francisco Climate Change Vignette")
}
