
# Load the complete TRY database
load("TRYdata.RData")

# Load auxiliary functions
source("AuxiliaryFunctions/demonTraitMeanBySp.R")
source("AuxiliaryFunctions/demonTraitVARBySp.R")
source("AuxiliaryFunctions/godTRY.R")
source("AuxiliaryFunctions/demonCheckScinames.R")
SOURCE("AuxiliaryFunctions/demonSelectBY.R")

##### Check your plant scientitic names according The Plant List (TPL) ######
# Before select your species in the TRY database, is possible that you need to check 
# if the scientific names are accepted or not. 
# The simple function "check_TPLScinames" will make the work for you. This function
# uses the awesome R package "Taxonstand". The function return a data.frame with five columns:
# [1] "UsedScinames" "Family"       "Genus"        "TPLSciname"   "Status" 
# The column TPLSciname contains the accepted scientific names of your species and you can
# use this new information as a vector to select your traits in the next step.

# You just need to enter a vector with your species names.
spp <- "a vector of scientific species names"

TPLspp <- check_TPLScinames(scinames = spp, saveResults = FALSE)

newspp <- as.character(TPLspp$TPLSciname)

##### Select traits by species #####
# This simple command lines will return a subset of the TRY database for only your species

spp <- "a vector of scientific species names"

spps <- selecBYspp(spp = spp, saveResults = TRUE)

##### Select traits by locations ####

# localities is a vector with the location ID according TRY website 
locs <- "a vector of locations"

locations <- selectBYlocation(localities = locs, saveResults = TRUE)

## NOTE: at this point you can erase the TRYdata of your R environment using rm(TRYdata) only to free memory in your computer, 
# but first you need to be sure that you extracted your needed information, either by species names, by localities or both.

##### calculate the Mean and sample Variance trait values ##### 
# The auxiliary function TraitMeanBySp will return a matrix with species in ROWS and mean trait values in COLUMNS 
# You just need to inform the TRY subset by species, locations or both

MEANtriatSpecies <- TraitMeanBySp(spps)

VARtraitSpecies <- TraitVARBySp(spps)

# save your results
write.csv(MEANtriatSpecies, "your_file_name.csv")
write.csv(VARtriatSpecies, "your_file_name.csv")

# Also, you can load the subset that you saved in your computer using the functions selectBYspp or selectBYlocation, for example:

file <- "C:/Users/jpintole/Dropbox/TRY_DB/TraitsBYspecies.csv"

data <- read.table(file = file, sep = ',', h = T, na.strings = "", stringsAsFactor = FALSE, quote = "\"", comment.char = "")

MEANtriatSpecies <- TraitMeanBySp(data)

VARtraitSpecies <- TraitVARBySp(data)

# save your results
write.csv(MEANtriatSpecies, "your_file_name.csv")
write.csv(VARtraitSpecies, "your_file_name.csv")

TRYtraitIDs
