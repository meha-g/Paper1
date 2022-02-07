#### Preamble ####
# Purpose: Download data 
# Author: Meha Grewal
# Data: 3 January 2021
# Contact: meha.grewal@mail.utoronto.ca
# License: MIT
# Pre-requisites: 
# - Need to have downloaded the data and saved it to inputs/data
# - Don't forget to gitignore it!



#### Workspace setup ####
# Use R Projects, not setwd().
library(haven)
library(tidyverse)

## Data Download
#From Open Data Toronto https://open.toronto.ca/dataset/neighbourhood-crime-rates/

library(opendatatoronto)
library(dplyr)

# get package
package <- show_package("fc4d95a6-591f-411f-af17-327e6c5d03c7")
package

# get all resources for this package
resources <- list_package_resources("fc4d95a6-591f-411f-af17-327e6c5d03c7")

# identify datastore resources; by default, Toronto Open Data sets datastore resource format to CSV for non-geospatial and GeoJSON for geospatial resources
datastore_resources <- filter(resources, tolower(format) %in% c('csv', 'geojson'))

# load the first datastore resource as a sample
crime_rates <- filter(datastore_resources, row_number()==1) %>% get_resource()
crime_rates

##Save Data
write_csv(crime_rates, "inputs/data/crime_rates.csv")
#end



# Read in the raw data. 
raw_data <- readr::read_csv("inputs/data/raw_data.csv"
                     )
# Just keep some variables that may be of interest (change 
# this depending on your interests)
names(raw_data)

reduced_data <- 
  raw_data %>% 
  select(first_col, 
         second_col)
rm(raw_data)
         




         