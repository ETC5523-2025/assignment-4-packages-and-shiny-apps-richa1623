
library(terra)
library(dplyr)
library(tidyr)
library(lubridate)
library(stringr)
library(here)
sds <- terra::sds(here("data-raw", "data.nc"))
sds

datafile <- here::here("data-raw", "data.nc")

# load the fwinx variable
data_fire <- terra::rast(paste0('NETCDF:"', datafile, '":fwinx'))

data_fire

df <- as.data.frame(data_fire, xy = TRUE, cells = FALSE, na.rm = TRUE, all = TRUE) %>%
  pivot_longer(
    cols = starts_with("fwinx"),
    names_to = "time_raw",
    values_to = "fwi"
  ) %>%
  mutate(
    # Extract numeric timestamp from layer name
    timestamp = str_extract(time_raw, "\\d+") %>% as.numeric(),
    date = as_datetime(timestamp, origin = "1970-01-01", tz = "UTC"),
    year = year(date),
    month = month(date, label = TRUE),
    # Fix longitudes
    x = if_else(x > 180, x - 360, x)
  ) %>%
  # Filtering to southern-east Australia which the report analysed
  filter(
    between(x, 140, 160),   # longitude
    between(y, -45, -25),   # latitude
    month %in% c("Sep","Oct","Nov","Dec","Jan","Feb")
  )



# Collapse to yearly summaries
bushfire <- df %>%
  group_by(year) %>%
  summarise(
    fwi_mean = mean(fwi, na.rm = TRUE),
    fwi_max  = max(fwi, na.rm = TRUE),
    .groups = "drop"
  )

