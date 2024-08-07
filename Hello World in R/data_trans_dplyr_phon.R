library(tidyverse)
library(nycflights13)

# data()
# Data sets in package ‘nycflights13’:
#   
# airlines               Airline names.
# airports               Airport metadata
# flights                Flights data
# planes                 Plane metadata.
# weather                Hourly weather data

df_flights <- flights
df_airports <- airports
df_airlines <- airlines
df_planes <- planes
df_weather <- weather

## write 5 queries from nycflights13 with dplyr

## 1. count model of plane has engine = 2 filter by manufacturer, model order by manufacturer model
count_model <- df_planes |>
  filter(engines == 2) |>
  group_by(model) |>
  mutate(n = n()) |>
  select(manufacturer, model, n) |>
  distinct() |>
  arrange(manufacturer, model)
print(count_model)  

## 2. count flights by airline names
count_flight <- inner_join(df_flights, df_airlines, by = "carrier") |>
  group_by(name, carrier) |>
  mutate(n = n()) |>
  select(name, n) |>
  distinct() |>
  arrange(name)
print(count_flight) 

## 3. average departure delay and arrival delay each airlines order by carrier name
avg_delay <- df_flights |>
  group_by(carrier) |>
  mutate(avg_dep_delay = mean(dep_delay, na.rm = TRUE),
         avg_arr_delay = mean(arr_delay, na.rm = TRUE)) |>
  select(carrier, avg_dep_delay, avg_arr_delay) |>
  distinct() |>
  arrange(carrier)
print(avg_delay)

## 4. get top 10 model is popularly used
count_plane <- inner_join(df_flights, df_planes, by = "tailnum") |>
  group_by(model) |>
  mutate(count_freq = n()) |>
  select(model, count_freq) |>
  distinct() |>
  arrange( desc(count_freq), model ) |>
  head(10)
print(count_plane)

## 5. get top 5 destination is popularly
count_airport <- inner_join(df_flights, df_airports, by = c("dest" = "faa")) |>
  group_by(name)|>
  mutate(count_freq = n()) |>
  select(name, count_freq) |>
  distinct() |>
  arrange( desc(count_freq) ) |>
  head(5)
print(count_airport)
