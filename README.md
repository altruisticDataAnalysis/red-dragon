# red-dragon

San Francisco Weather Data

Jeffrey Long

https://jeffreycarllong.com

10/7/2017

This program wrangles data using R code. The data is from the weather station nearest to my home in Duboce Triangle, SF, CA. The National Oceanic and Atmospheric Administration (NOAA) National Centers For Environmental Information, is the source of the local station data.

The first dataset obtained for station USW00023272 were daily summaries for all time, relative to this SF weather station.

San Francisco Yearly Average Max Temp
Calculating and plotting the mean max temp per year for all data collected at San Francisco weather station.

```{r}
    library(tidyverse)
## Loading tidyverse: ggplot2
## Loading tidyverse: tibble
## Loading tidyverse: tidyr
## Loading tidyverse: readr
## Loading tidyverse: purrr
## Loading tidyverse: dplyr
## Warning: package 'dplyr' was built under R version 3.4.2
## Conflicts with tidy packages ----------------------------------------------
## filter(): dplyr, stats
## lag():    dplyr, stats
    sfDaily <- read_csv("sf1921to2017GhcnDaily.csv")
## Parsed with column specification:
## cols(
##   .default = col_character(),
##   LATITUDE = col_double(),
##   LONGITUDE = col_double(),
##   ELEVATION = col_double(),
##   DATE = col_date(format = ""),
##   PRCP = col_double(),
##   SNOW = col_double(),
##   SNWD = col_integer(),
##   TMAX = col_integer(),
##   TMIN = col_integer(),
##   WT03 = col_integer(),
##   WT04 = col_integer(),
##   WT05 = col_integer(),
##   WT16 = col_integer(),
##   WT18 = col_integer()
## )
## See spec(...) for full column specifications.
        #Checking if any columns have just NAs. None do. So none are removed.
    sfDaily <- sfDaily[,colSums(is.na(sfDaily))<nrow(sfDaily)]
    sfDaily$YEAR <- substring(sfDaily$DATE,1,4)
    sfYearMax <- sfDaily %>%
        group_by(sfDaily$YEAR) %>%
        summarise((sfDaily = mean(TMAX)))
    plot(sfYearMax)
```
