## call library
library(tidyverse)
library(glue)
library(RSQLite)


## create new database
## homework3 - create a new restaurent.db

con <- dbConnect(SQLite(), "school.db")

dbListTables(con)

dbWriteTable(con, "students",
             data.frame(id=1:2,
                        names=c("toy", "joe"))
             )
dbGetQuery(con, "select names from students")
