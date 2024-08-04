## call library
library(tidyverse)
library(glue)
library(RSQLite)

## create new database
con <- dbConnect(SQLite(), "restaurant.db")

dbWriteTable(con, "menu",
             data.frame(menu_id=1:20,
                        dish_name=c("Margherita Pizza", 
                                    "Spaghetti Carbonara",
                                    "Tiramisu",
                                    "Lasagna",
                                    "Garlic Bread",
                                    "House Salad",
                                    "Chicken Alfredo",
                                    "Calamari Fritti",
                                    "Penne Arrabbiata",
                                    "Gelato"),
                        price=c(12.99,
                                14.99,
                                6.99,
                                13.99,
                                4.99,
                                7.99,
                                15.99,
                                9.99,
                                12.99,
                                4.99
                                ))
)
