## call library
library(tidyverse)
## use nycfilghts13 -> airline information
library(nycflights13)

df <- read_csv("flights.csv")

## homework
## dplyr 5 queries

df |>
  select (1:5) |>
  filter (month == 9)

df |>
  count (carrier) |>
  arrange(-n) |>
  head(5) |>
  left_join(airlines)

?flights ## call data information
