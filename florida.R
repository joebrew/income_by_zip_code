library(readr)
library(readxl)

fl <- read_excel('data/13zp10fl.xls', skip = 3)
fl <- fl[which(is.na(fl$`Size of adjusted gross income`)),]
fl <- fl[which(!is.na(fl$`ZIP\ncode`)),]
# Clean
# df <- data.frame(zip = unique(sort(fl$`ZIP\ncode`)))
# fl$returns <- fl$dependents <- fl$income <- NA

# Calculate $ per person
fl$val <- as.numeric(as.character(fl$`Adjusted gross income (AGI) [2]`)) / 
  (fl$`Number of dependents` + fl$`Number of returns`)
