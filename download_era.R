library(ecmwfr)


dates_to_era <- function(dates) {
  paste0(lubridate::year(dates),
         formatC(lubridate::month(dates), width = 2, flag = "0"),
         formatC(lubridate::day(dates), width = 2, flag = "0"),
         collapse = "/")
}

dates <- dates_to_era(seq.Date(as.Date("1900-01-01"), as.Date("2010-12-01"),
                               by = "1 month"))
levels <- "1000/975/950/925/900/875/850/825/800/775/750/700/650/600/550/500/450/400/350/300/250/225/200/175/150/125/100/70/50/30/20/10/7/5/3/2/1"

# ERA-20C
query <- list(
  class = "e2",
  dataset = "era20c",
  date = dates,
  grid = "2.5/2.5",
  expver= "1",
  levelist = levels,
  levtype = "pl",
  param = "129.128",
  stream = "moda",
  type = "an",
  target = "ERA20C_monthly_hgt.nc",
  format = "netcdf"
) %>%
  wf_request(user = "eliocampitelli@gmail.com",
             transfer = TRUE, path = ".")


levels <- "1000/925/850/775/700/600/500/400/300/250/200/150/100/70/50/30/20/10/7/5/3/2/1"
dates <- dates_to_era(seq.Date(as.Date("1957-09-01"), as.Date("2002-08-01"),
                               by = "1 month"))

# ERA40
query <- list(
  class = "e4",
  dataset = "era40",
  date = dates,
  grid = "2.5/2.5",
  expver= "1",
  levelist = levels,
  levtype = "pl",
  param = "129.128",
  stream = "moda",
  type = "an",
  target = "ERA40_montly_hgt.nc",
  format = "netcdf"
) %>%
  wf_request(user = "eliocampitelli@gmail.com",
             transfer = TRUE, path = ".")
