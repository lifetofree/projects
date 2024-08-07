## data visualization + markdown
library(tidyverse)

## ggplot2
## grammar of graphic 2D
## hadley wickham

names(mtcars)
## + as add layer
ggplot(data = mtcars, ## base layer
       mapping = aes(x = mpg, y = hp)) + ## base layer
  geom_point() + ## geom_point() -> point as scatter plot in ggsheets
  geom_smooth(method = "lm")

## cheatsheet ggplot2 in R
## discreete vs continuous

## discrete
## 1,2,3,4,5 or "M","F" or "high","med","low"

## continuous (measurement)
## 176.34535675683...

## quiz
## heart rate -> discrete => 1,2,3,4,...,150
## internet data(GB) -> continuous => 10 GB, 10.234523 GB
## it's can be a decimal

gpa <- c(3.41, 3.52, 2.98, 3.95)
## discrete, factor, categorical data

## character
gender <- c(rep("M", 10), rep("F", 8))

## factor(best practice and position has effect with data)
gender_factor <- factor(gender,
                        levels = c("M","F"),
                        label = c("M", "F"))
## table([variable]) -> count data in factor

animals <- c("cat", "dog", "hippo", "cat")
animals <- factor(animals)

## ordinal data => order data
## temperature: low < medium < high
## spending: low < medium < high
spending <- c("low", "high", "med", "med", "high")

spending <- factor(spending,
                   levels = c("low", "med", "high"),
                   label = c("low", "med", "high"),
                   ordered = TRUE)

## factor => 1. norminal data 2. ordinal data

## one varisble - continuous
ggplot(mtcars, aes(mpg)) +
  geom_histogram(bins = 5) ## 30 as default

base <- ggplot(mtcars, aes(mpg)) ## base layer

base + geom_density()
base + geom_histogram(bins = 5, fill = "gold", color = "black")
base + geom_area(stat = "bin")

## one variable - discrete/ categorical => can use geom_bar only T_T
# best practice
mtcars |>
  select(hp, wt, am) |>
  mutate( am = ifelse( am == 0, "Auto", "Manual")) |>
  ggplot(aes(am)) +
  geom_bar()

# alternate coding
ggplot(data = mtcars |>
         select(hp, wt, am) |>
         mutate( am = ifelse( am == 0, "Auto", "Manual")),
       aes(am)) +
  geom_bar()

## count data
mtcars |>
  select(hp, wt, am) |>
  mutate( am = ifelse( am == 0, "Auto", "Manual")) |>
  count(am)

## two variables, both continuous
base <- ggplot(data = mtcars,
       mapping = aes(hp, mpg))

base +
  geom_point() + ## scatter chart
  geom_smooth(method = "loess") + ## line chart :: use method = "lm" => linear model ## *** `geom_smooth()` using formula = 'y ~ x' ***
  geom_rug() ## view data distribution

## setting vs mapping
# setting => set manual
base + 
  geom_point(
    col = "red",
    size = 5,
    alpha = 0.9, ## opacity
    shape = 8 ## search point shapes variable in R
  )
# mapping => map column into element of chart
base +
  geom_point(
    mapping = aes(col = factor( am ))
  )

base + 
  geom_point(mapping = aes(col = wt))

## explore data with chart
# set.seed(42) ## fix result when random data
ggplot(diamonds |> sample_frac(0.1), aes(carat, price)) +
  geom_point()

# best practice
set.seed(42)
small_df <- diamonds |>
  sample_frac(0.1)

ggplot(small_df, aes(carat, price)) +
  geom_point(alpha = 0.1, color = "#E39786") + ## can use hex color replace color name
  theme_minimal() ## remove background color

ggplot(small_df, aes(carat, price)) +
  geom_point(mapping = aes(col = cut)) + 
  theme_minimal()

ggplot(small_df, ## data
       aes(carat, price, col = cut)) + ## mapping
  geom_point(size = 3, alpha = 0.2) + 
  theme_minimal()

## mapping is happen in aes function
## setting is manual value in chart

## filter more with cut value
set.seed(42)
small_df2 <- diamonds |>
  sample_frac(0.1) |>
  filter(cut %in% c("Fair", "Premium", "Ideal")) 

ggplot(small_df2, ## data
       aes(carat, price, col = cut)) + ## mapping
  geom_point(size = 3, alpha = 0.2) + 
  theme_minimal()

## facet, sub plot
base2 <- ggplot(small_df2, ## data
       aes(carat, price, col = cut)) + ## mapping
  geom_point(size = 3, alpha = 0.2) + 
  theme_minimal()

base2 +
  facet_wrap(~cut, nrow = 1) ## ncol, nrow change layout

base2 +
  facet_wrap(~color, ncol = 3)

## facet grid
base2 + 
  facet_grid(color ~ cut)

ggplot(small_df2 |> 
         filter( carat <= 2.5 ), ## data
                aes(carat, price)) + ## mapping
  geom_point(size = 3, alpha = 0.2) + 
  geom_smooth(se = FALSE, col = "red") + 
  theme_minimal() #+
  # facet_grid(color ~ cut)

## set title, caption, x/y labels
base3 <- ggplot(small_df2 |> 
                  filter( carat <= 2.5 ), ## data
                aes(carat, price)) + ## mapping
  geom_point(size = 3, alpha = 0.2) + 
  geom_smooth(se = FALSE, col = "red") + 
  theme_minimal()

base3 +
  labs(title = "Correlation is very strong",
       subtitle = "Correlation is 0.85",
       caption = "Source: ggplot package",
       x = "Diamond Caret",
       y = "Price $ USD")

## change color manual
df <- data.frame(
  id = 1:5,
  friut = c(rep("orange", 3), rep("banana", 2)),
  price = c(20, 25, 21, 24, 30),
  weight = c(5, 4, 7, 6, 10)
)

ggplot(df, aes(weight, price, color = friut)) + 
  geom_point(size = 3) +
  scale_color_manual(values = c("gold", "blue")) +
  theme_minimal()

ggplot(df, aes(weight, price, color = price)) + 
  geom_point(size = 3) +
  theme_minimal() + 
  scale_color_gradient(low = "gold", high = "blue")

## final tips - multiple dataframe in one chart
df1 <- df |> filter(weight < 7)
df2 <-  df |> filter(weight >= 7)

ggplot() +
  theme_minimal() + 
  geom_point(data = df1, 
             mapping = aes(weight, price),
             color = "salmon", size = 3) +
  geom_point(data = df2, 
             mapping = aes(weight, price),
             color = "gold", size = 3)

## homework
## 5 chart with markdown
## What you see in chart that your build

