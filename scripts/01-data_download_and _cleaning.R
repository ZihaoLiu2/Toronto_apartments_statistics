#### Preamble ####
# Purpose: Set up and clean the Toronto apartments data from opendatatoronto
# Author: Zihao Liu
# Date: 23 April 2022
# Contact:zihaohans.liu@mail.utoronto.ca

library(tidyverse)
library(opendatatoronto)
library(dplyr)

#### Code from opendatatoronto ####
#From https://open.toronto.ca/dataset/apartment-building-evaluation/
# get package
package <- show_package("4ef82789-e038-44ef-a478-a8f3590c3eb1")
package

# get all resources for this package
resources <- list_package_resources("4ef82789-e038-44ef-a478-a8f3590c3eb1")

# identify datastore resources; by default, Toronto Open Data sets datastore resource format to CSV for non-geospatial and GeoJSON for geospatial resources
datastore_resources <- filter(resources, tolower(format) %in% c('csv', 'geojson'))

# load the first datastore resource as a sample
data <- filter(datastore_resources, row_number()==1) %>% get_resource()


### Save raw data ###
write_csv(data, "inputs/data/raw_apartment_data.csv")

### Data cleaning ###
data$SCORE = as.numeric(data$SCORE)
data$CONFIRMED_STOREYS = as.numeric(data$CONFIRMED_STOREYS)
data$CONFIRMED_UNITS = as.numeric(data$CONFIRMED_UNITS)
data$YEAR_BUILT = as.numeric(data$YEAR_BUILT)
data$YEAR_REGISTERED = as.character(data$YEAR_REGISTERED)

clean_data <- drop_na(data[c(3:11,13)])

### Save the cleaned data ###
write_csv(clean_data, "inputs/data/cleaned_apartment_data.csv") 

