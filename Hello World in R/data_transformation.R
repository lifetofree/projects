## call library
library(tidyverse)
library(glue)
library(RSQLite)

## glue => spring template
name <- "toy"
age <- 35

glue("Hello my name is {name}, and I'm {age} years")

## list.file => call file list 
## connect sqlite database
con <- dbConnect(SQLite(), "chinook.db")

## how to many table
dbListTables(con)

## check column names in a table
dbListFields(con, "customers")

## get data from a table
usa_customers <- data.frame (dbGetQuery(con, "SELECT 
                                firstname, 
                                lastname,
                                country,
                                email
                              FROM customers
                              WHERE country = 'USA'
                              ")
                             )
print (usa_customers)

## write table into a database
branchs <- data.frame(
  branch_id = 1:3,
  branch_name = c("BKK", "LOM", "SEOUL")
)

dbWriteTable(con, "branches", branchs)

## remove table
dbRemoveTable(con, "brannches", TRUE)

## close connection
dbDisconnect(con)
