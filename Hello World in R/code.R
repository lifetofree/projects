# basic programing for data analyst
# 1. variable
# 2. data type
# 3. data structure
# 4. function
#.5. control flow

## [0] basic calculation
1 + 1
2 - 5
5 * 2
5 / 2
2 ** 2 ## ** is power
2 ** 5
2 ** 20
(100 - 5) * 2
10 %% 3 ## %% modulo

## [1] variables
## reuseable

new_income <- 35000 * 1.2

expense <- 22000

saving <- income - expense

## remove variable
rm(income)

##########

## [2] data types
## numberic, character, logical(TRUE/FALSE), date

money_in_my_pocket <- 150 ## declare variable "snake case"
my_age <- 40
my_name <- "Phon aka lifetofree"
movie_lover <- TRUE # FALSE

today_date <- as.Date("2024-07-02")

## check data type
class(my_age)
class(my_name)
class(movie_lover)
class(today_date)

c(TRUE, TRUE, FALSE) ## declare vector
sum(c(TRUE, TRUE, FALSE)) ## TRUE = 1, FALSE = 0

## change data type
as.numeric(TRUE)

## 555 is numeric
## "555" is string

##########

## [3] data structure
## 1. vector -> 1 type 1 direction
## 2. matrix -> 2D vector
## 3. list
## 4. dataframe -> table has column and row

## [3.1] vector, contains only single data type
1:10
seq(from=1, to=100, by=5)
seq(1,100,5)
friends <- c("toy", "john", "joe", "anne", "marry")
## c("toy", "john", 30) --> c("toy", "john", "30") # convert from numeric to string
ages <- c(35, 32, 28, 29, 30)
mavel_lover <- c(T, F, T, F, F) ## c(TRUE, FALSE, TRUE, FALSE, FALSE)
length(friends) ## check length of vector
## index in R start at 1 ##
friends[2] ## result is "john"
friends[6] ## result is NA(Not available)
friends[1:3]
friends[4:5]
friends[c(1,3,5)] ## subset by position
ages >=30 ## find ages >= 30 and result is TRUE  TRUE FALSE FALSE  TRUE
sum(ages >= 30) ## result is 3
## subset by condition
ages[ ages >= 30 ] ## result is 35 32 30
friends[ ages >= 30 ] ## result is "toy"   "john"  "marry"
## subsets by name
my_special_vector <- c(a=1, b=2, d=3)
my_special_vector["a"] ## result is
##
##  a
##  1
##

## [3.2] matrix
## 2D vector
m1 <- matrix(1:4, ncol = 2)
##      [,1] [,2]
##[1,]    1    3
##[2,]    2    4
m1 <- matrix(1:4, ncol = 2, byrow = T)
##      [,1] [,2]
##[1,]    1    2
##[2,]    3    4
my_vec <- 1:25
## [1]  1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25
matrix(my_vec, ncol = 5)
##      [,1] [,2] [,3] [,4] [,5]
##[1,]    1    6   11   16   21
##[2,]    2    7   12   17   22
##[3,]    3    8   13   18   23
##[4,]    4    9   14   19   24
##[5,]    5   10   15   20   25

m1 + 100
m1 + m1

m2 <- matrix(c(5,5,2,1), ncol = 2)

m1 * m2

m1 %*% m2
##     [,1] [,2]
##[1,]   15    4
##[2,]   35   10

## [3.3] list
## 
john <- list (
  first_name = "john",
  last_name = "wick",
  age = 45,
  city = "Bangkok",
  occupation = "teacher",
  salary = 100000,
  marvel_fan = T,
  marvel_movies = c("Thor",
                    "Loki Series",
                    "Infiny War")
)

john$first_name
john$marvel_movies[2]

marry <- list(
  full_name = "marry anne",
  age = 28,
  city = "London",
  football_fan = T,
  fav_team = c("LiverPool", "Chelsea")
)

## nested list
customer <- list(id01 = john, 
                 id02n = marry)
customer$id02$full_name

## [3.4] dataframe => excel, csv
##
id <- 1:5
friends <- c("toy", "john", "joe", "anne", "marry")
ages <- c(35, 32, 28, 29, 30)
own_a_dog <- c(T,T,F,F,F)
city <- c("BKK", "LON", "LON", "TOK", "TOK")

data.frame(id, friends, ages, own_a_dog, city)

## create a new dataframe
df <- data.frame(id, friends, ages, own_a_dog, city)
## structure of this df
str(df)
## dimension
dim(df)
## summary
summary(df)
## subset dataframe
df[3,2] ## df[row,column]
df[1:3, ] ## row 1-3 all column
df[1:3, c("friends", )]
df[ df$ages >= 30]
df[[5]]
df$city

## three wau that we can subset in R
## []
## 1. by position
## 2. by name
## 3. by condition

df[ df$friends == "toy", ]

## not equal
## use !=
2*2 != 4
!F

## working with dataframe
## create column
df$fav_menu <- c("somtum",  "hotdog", "pizza", "french fried", "hotgog")

## remove column
df$fav_menu <- NULL

##new row
df2 <- data.frame(
  id = 6:7,
  friends = c("wick", "ky"),
  ages = c(25,26),
  own_a_dog = c(T, F),
  city = c("BKK", "LON")
)

full_df <- rbind(df, df2)

## view dataframe and export to csv
View(full_df)
write.csv(full_df, "result.csv", row.names = F) 
## that's file in Files then select file and click More > Export
## you can edit csv file then save file
## if you want read file back to R Project
df <- read.csv("result.csv")

##########

## [4] function
## reuseable code 
hello <- function() {
  print("Hello World")
}
## call function
hello()

my_stupid_function <- function() {
  hello()
  hello()
  hello()
}

cube <- function(base, power) {
  base ** power
}
cube(5,2)

##########

## [5] control flow
## 
