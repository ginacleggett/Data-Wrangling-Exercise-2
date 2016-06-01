> titanic_original <- read.csv("~/Data-Wrangling-Exercise-2/titanic_original.csv")
>   View(titanic_original)
> library(dplyr)

Attaching package: ‘dplyr’

The following objects are masked from ‘package:stats’:
  
  filter, lag

The following objects are masked from ‘package:base’:
  
  intersect, setdiff, setequal, union

> library(tidyr)
> titanic <- titanic_original
> View(titanic)
> #The embarked column has some missing values, which are known to correspond to passengers who actually embarked at Southampton. Find the missing values and replace them with S. (Caution: Sometimes a missing value might be read into R as a blank or empty string.)
  > titanic$embarked[titanic$embarked == ""] <- "S"
> #You’ll notice that a lot of the values in the Age column are missing. While there are many ways to fill these missing values, using the mean or median of the rest of the values is quite common in such cases.
  > titanic$age[is.na(titanic$age)==1] <- mean(titanic$age, na.rm = TRUE)
> titanic$age <- round(titanic$age, digits = 2)
> titanic$age <- round(titanic$age, digits = 0)
> #You’re interested in looking at the distribution of passengers in different lifeboats, but as we know, many passengers did not make it to a boat :-( This means that there are a lot of missing values in the boat column. Fill these empty slots with a dummy value e.g. the string 'None' or 'NA'
  > titanic$boat <-gsub("", "NA", titanic$boat)
> titanic$boat <-gsub("NA", "", titanic$boat)
> titanic$boat{titanic$boat == ""} <- "NA"
Error: unexpected '{' in "titanic$boat{"
> titanic$boat[titanic$boat == ""] <- "NA"
> #You have a hunch that the fact that the cabin number is missing might be a useful indicator of survival. Create a new column has_cabin_number which has 1 if there is a cabin number, and 0 otherwise.
  > titanic$has_cabin_number <- ifelse(titanic$cabin == "", 0,1)
> 