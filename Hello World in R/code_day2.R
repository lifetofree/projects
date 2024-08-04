## Recap basic programming
# 1. variable x <- 100
# 2. data type
# 3. data structure : vector, list, matrix, df
# 4. function ✅
#.5. control flow ✅

## create your own function

greeting <- function() {
  print("Hello World")  
}

greeting_with_name <- function(name) {
  text <- paste0("Hi! ", name)
  print(text)
}

## simple function
## default argument
add_two_num <- function(x=10, y=20) {
  return(x + y)
}

cube <- function(base, power=3) {
  base ** power
}

cube2 <- function(base, power=3) base ** power ## inline function

## function call another function
hi1 <- function() print("hi!")
hi2 <- function() print("hi hi!")
hi3 <- function() print("hello!")

all_hi <- function() {
  hi1()
  hi2()
  hi3()
}

##.5. control flow
## if, for, while

## if
ifelse(10>2, T, F)
10>2

grading <- function(score) {
  if (score >= 80) {
    return("A")
  } else if (score >=70) {
    return("B")
  } else if (score >= 60) {
    return("C")
  } else if (score >= 50) {
    return("D")
  } else {
    return("F")
  }
}

## for
## because R is vectorization then for loop is useless in R

1:10
1:10 %% 2 == 0

for(i in 1:10) {
  print(i)
}

nums <- c(25, 30, 40, 100, 1225)
for(i in nums) {
  if ( i %% 2 == 0) {
    print(paste0(i, " : even number"))
  } else {
    print(paste0(i, " : odd number"))
  }
}

ifelse(nums %% 2 == 0, "even", "odd")


## while loop
## while ([condition]) {
##    ## do something
## }
count <- 0
while (count < 5) {
  print("not remember")
  count = count + 1
  if (count == 5) {
    print("remember")
  }
}

## take input from a user
user_name <- readline("what is your name : ") ## input from user is always string
user_pw <- readline("your password : ")

## login logic
users <- c("toy", "john", "mary")
pw <- 1234

func_login <- function() {
  print("Welcome to site")
  username <- readline("Username : ")
  password <- readline("Password : ")
  if ((username %in% users) & (password == pw)) {
    print("Login successfully !!!")
  } else {
    print("Try again !!!")
  }
}

## homework
## 1. chatbot order pizza
pizza <- function() {
  print("Hello!!! Welcome to pizzeria restaurant")
  ## present menu to a user
  ## let them choose a menu
  ## let them choose a drink
  ## bounus - check bill
}

## 2. pao ying chub
play_game <- function() {
  games <- 0
  while (games < 10) {
    ## pao ying chub
    ## sample(1:3, 1) ## random 1 number in 1 to 3
  } 
}