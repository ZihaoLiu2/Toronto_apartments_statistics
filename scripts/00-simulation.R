#### Preamble ####
# Purpose: Simulate the data of apartments in Toronto
#Author: Zihao Liu
#Date: 23 April 2022
#Contact: zihaohans.liu@mail.utoronto.ca

library(tidyverse)
##Simulate data##
set.seed(588)

simulated_data_apartments <- tibble(
  year_built = floor(runif(1000, min=1900, max=2022)),
  property_type = sample(c("PRIVATE","TCHC","SOCIAL HOUSING"), size =1000, replace =TRUE, prob = c(1/3,1/3,1/3)),
  WARD = sample(1:25,size =1000, replace = TRUE, prob = c(rep(0.04,25))),
  confirmed_storeys = sample(3:50,size = 1000, replace =TRUE,prob=c(rep(1/48,48))),
  confirmed_units = sample(50:1000, size =1000, replace = TRUE, prob =c(rep(1/951,951))),
  score = floor(rnorm(1000,mean =60, sd =5))
)