## call library
library(tidyverse)
library(dplyr)
library(glue)
library(RSQLite)
library(readxl)
library(jsonlite)

## read file into R
df1 <- read_csv("student_01.csv") ## split with comma
print(df1)
df2 <- read_csv2("student_02.csv") ## split with semicolon
print(df2)
df3 <- read_delim("student_03.txt", delim = "|") ## split with set delimiter
print(df3)
df4 <- read_tsv("student_04.tsv") ## split with tab
print(df4)
## read excel file, sheet1
df5 <- read_excel("student_05.xlsx", sheet = 1) ## or read_excel("student_05.xlsx", sheet = "Sheet1")
print(df5)

## list files
## list.files(pattern = "*.json")

## how to read json file to R
my_profile <- fromJSON("my_profile.json")
print(my_profile)

## read json file as data frame
temp <- fromJSON("example_df.json")
print(temp)

## data transformation 101
## 1. select columns => SQL select
## 2. filter rows => SQL where
## 3. arrange => SQL order by
## 4. mutate (create now columns)
## 5. summerise => SQL aggregrate function

## mtcars => built in data frame in R 
## how to call data in machine => data()

## head(mtcars) => select top 6 of data, head(mtcars, [limit])
## tail(mtcars) => select bottom 6 of data
## colnames(mtcars) => select column names
## rownames(mtcars) => select row names

car_names <- rownames(mtcars)
print(car_names)
## add columns
mtcars$model <- car_names
print(car_names)
## delete columns
rownames(mtcars) <- NULL
mtcars

## how to select column
select(mtcars, hp, wt, am) ## select([df],[col names,...,])
select(mtcars, 1:5, 10) ## select([df],[position]) => select from mtcars, column 1 to 5 amd column 10
select(mtcars, am, hp, 10)

select(mtcars, contains("a"))

## subset => name, position, condition ##

## data transformation pipeline => can get result to next parameter, flow top to bottom
mtcars %>%
  select( model, hp, wt, am ) %>%
  filter( hp >= 200 )

## native pipe in R ( without library ) => new feature in R
mtcars |>
  select( model, hp, wt, am ) |>
  filter( hp >= 200 )

## example send "hi" to function print()
## "hi" |> print()
## "hi" %>% print()

## more 1 conditions
mtcars |>
  select( model, hp, wt, am ) |>
  filter( hp >= 200 & wt < 5 & am == 1 )

mtcars |>
  select( model, hp, wt, am ) |>
  filter( hp >= 200 | hp <= 90 )

## between
mtcars |>
  select( model, hp, wt, am ) |>
  filter( between ( hp, 100, 180 ) )

## car name contains => regular expression
grepl("^M.+", car_names) ## return with boolean
car_names
grep("^M.+", car_names) ## return with index
car_names

mtcars |>
  select( model, hp, wt, am ) |>
  filter( grepl("^M.+", car_names) )

## reset mtcars data frame built in data frame to original data frame
## data('mtcars')

mtcars |>
  select( model, hp, wt, am ) |>
  filter( grepl("^M.+", car_names) & hp >= 180 )

## arrange
mtcars |>
  select( model, hp, wt, am ) |>
  filter( grepl("^M.+", car_names) ) |>
  arrange( hp ) ## in case of number if want order by desc => desc( hp ), ( -hp )

mtcars |>
  select( model, hp, wt, am ) |>
  filter( grepl("^M.+", car_names) ) |>
  arrange( am, desc( hp ) )

m_cars <- mtcars |>
  select( model, hp, wt, am ) |>
  filter( grepl("^M.+", car_names) ) |>
  arrange( am, desc( hp ) )
## View(m_cars)

## mutate 
## select and filter can be switch order
## new column always display right side
mtcars |> 
  filter ( hp < 100 ) |>
  select( model, am, hp ) |>
  mutate ( am_label = ifelse ( am == 0, "Auto", "Manual"  ) )

hp_df <- mtcars |> 
  filter ( hp < 100 ) |>
  select( model, am, hp ) |>
  mutate ( am_label = ifelse ( am == 0, "Auto", "Manual"  ),
           hp_scale = hp / 100,
           hp_double = hp * 2)
## View(hp_df)
## if new column name  = old column name value is override old column

## summerise
## library sqldf => write sql state in R => didn't use just try to see some point
mtcars |>
  summarise(mean_hp = mean ( hp ),
            sum_hp = sum ( hp ),
            median_hp = median ( hp ),
            sd_hp = sd ( hp ),
            n = n () )

mtcars |>
  filter ( wt <= 5 ) |> 
  summarise(mean_hp = mean ( hp ),
            sum_hp = sum ( hp ),
            median_hp = median ( hp ),
            sd_hp = sd ( hp ),
            n = n () )

mtcars |>
  filter ( wt <= 5 ) |> 
  summarise(mean_hp = mean ( hp ),
            sum_hp = sum ( hp ),
            median_hp = median ( hp ),
            sd_hp = sd ( hp ),
            n = n () )

## format example
# data |>
#   select() |>
#   filter() |>
#   arrange() |>
#   mutate() |>
#   summerise() |>
#   ...