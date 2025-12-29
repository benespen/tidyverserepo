# Chapter 3

# load packages
library(nycflights13)
library(tidyverse)

# look at the table
View(flights)

# functions in the dplyr package are called verbs
# each function does one thing, so you pass the output to another function
# input is a data frame, and the output is a data frame
# here is an example using the native pipe operator

flights |>
  filter(dest == "IAH") |> 
  group_by(year, month, day) |> 
  summarize(
    arr_delay = mean(arr_delay, na.rm = TRUE)
  )

# dplyr’s verbs are organized into four groups based on what they operate on: 
# rows, columns, groups, or tables


# Rows --------------------------------------------------------------------

# filter() allows you to keep rows based on the values of the columns

# eg all flights more than two hours late
flights |> 
  filter(dep_delay > 120)

# Flights that departed on January 1
flights |> 
  filter(month == 1 & day == 1)

# Flights that departed in January or February
flights |> 
  filter(month == 1 | month == 2)

# A shorter way to select flights that departed in January or February
flights |> 
  filter(month %in% c(1, 2))

# to save the output we use the assignment operator
jan1 <- flights |> 
  filter(month == 1 & day == 1)

# arrange() changes the order of the rows based on the value of the columns

# sort by departure time
flights |> 
  arrange(year, month, day, dep_time)

# You can use desc() on a column inside of arrange() to re-order the 
# data frame based on that column in descending (big-to-small) order
flights |> 
  arrange(desc(dep_delay))

# Remove duplicate rows, if any
flights |> 
  distinct()

# Find all unique origin and destination pairs
flights |> 
  distinct(origin, dest)

# keep all columns when using distinct() with .keep_all = TRUE
# only keeps the values of the first row found during this operation
flights |> 
  distinct(origin, dest, .keep_all = TRUE)

# count and then sort largest to smallest count
flights |>
  count(origin, dest, sort = TRUE)

# find all flights with an arrival delay of more than two hours
flights |> 
  filter(arr_delay > 120)

# Flew to either Houston or Hobby International
df_houston <- flights |> 
  filter(dest %in% c("HOU", "IAH"))
View(df_houston)

# United, American, or Delta
df_airline <- flights |> 
  filter(carrier %in% c("AA", "DL", "UA"))
View(df_airline)

# Departed July, August, September
df_month <- flights |> 
  filter(month %in% c(7, 8 , 9))
View(df_month)

# Arrived more than two hours late but didn’t leave late
df_no_dep_delay <- flights |> 
  filter(arr_delay > 120 & dep_delay < 1)
View(df_no_dep_delay)
# Columns -----------------------------------------------------------------


# Groups ------------------------------------------------------------------




# Tables ------------------------------------------------------------------


