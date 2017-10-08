# red-dragon

## San Francisco Yearly Max Temp 

For Daily Weather Data at Station USW00023272

From 1921 to 2017 

![San Francisco Yearly Max Temp From 1921 to 2017 From Daily Weather Data at Station USW00023272](https://github.com/altruisticDataAnalysis/red-dragon/blob/master/San%20Francisco%20Yearly%20Max%20Temp.png)

The program below wrangles data using R code. The data is from the weather station nearest my home in Duboce Triangle, SF, CA. [The National Oceanic and Atmospheric Administration (NOAA) National Centers For Environmental Information](https://www.ncdc.noaa.gov/) is the data source. The daily weather data summaries are for all time, relative to this SF weather station existence.

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

MIT License

Copyright (c) 2017 Jeffrey Long

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
