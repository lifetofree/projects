## call library
library(tidyverse) ## ggplot2
## dplyr +  gg plot
library(dplyr)

## data transformation 101
## 1. select columns => SQL select
## 2. filter rows => SQL where
## 3. arrange => SQL order by
## 4. mutate (create now columns)
## 5. summerise => SQL aggregrate function
## other functions: count, distiinct
## join tables, bind_row, bind_col

## dplyr ( part of tinyverse)
## select(),filter(), arrange(), mutate(), summerise()
df <- mtcars |>
  rownames_to_column(var = "model") |>
  tibble()

df <- tibble(mtcars)
df

## snadom sample / sampling
set.seed(42) ## for lock result when use sample
df |>
  sample_n(3)

df |>
  sample_frac(0.2) 

df |>
  select ( model, am ) |>
  mutate ( am_text = ifelse(am == 0, "Auto", "Manual") ) |>
  count( am_text ) |>
  mutate ( pct = n / sum( n ))

## ?distinct => view help

model_names <- df |>
  select ( model, am ) |>
  mutate ( am_text = ifelse(am == 0, "Auto", "Manual") ) |>
  distinct( model ) |>
  pull() ## change to vector

model_names

grep( "Mazda.+", model_names )
grepl( "Mazda.+", model_names )

## join tables
## sql joins
## inner, left, right, full
## inner join
inner_join(band_members, band_instruments, by = "name")

## left join
band_members |>
  inner_join(band_instruments, by = "name")

band_members |>
  left_join(band_instruments, by = "name")

## right join
band_members |>
  right_join(band_instruments, by = "name")

## full outer join
band_members |>
  full_join(band_instruments, by = "name") |>
  drpo_na() ## delete missing member
## full join with drop_na() like inner join

## replace na
band_members |>
  full_join(band_instruments, by = "name") |>
  mutate(plays = replace_na( plays, "drum"), 
         band = replace_na( band, "Aerosmith"))

## union data
df1 <- data.frame( id = 1:3,
                   name = c("toy", "john", "mary"))

df2 <- data.frame( id = 3:5,
                   name = c("mary", "anna", "devid"))

## remove duplicate
df1 <- bind_rows(df1, df2)
df1 |>
  bind_rows(df1, df2) |>
  distinct(name)

## join in case
df3 <- data.frame(id=6:8,
                  name=c("a","b","c"))

df4 <- data.frame(id=9:10,
                  name=c("d","e"))

## bind rows and then remove duplicates
df1 |>
  bind_rows(df2) |>
  bind_rows(df3) |>
  bind_rows(df4) |>
  distinct()

## shortcut when we have multiple dataframes
list_df <- list(df1, df2, df3, df4)

list_df |> 
  bind_rows() |>
  distinct()


## join in case key names are not the same
band_members |>
  rename(friend = name) |>
  left_join(band_instruments, by=c("friend"="name") )

## basic data visualization
## grammar of graphic

## histogram
qplot(mpg, data=mtcars, geom="histogram", bins=10)

## density
qplot(mpg, data=mtcars, geom="density")

## scatter plot
qplot(x=hp, y=mpg, data=mtcars, geom="point")

## ggplot
ggplot(data = mtcars,
       aes(x = hp, y = mpg)) +
  geom_point(col="red") +
  geom_smooth(se=F) +
  theme_minimal()
