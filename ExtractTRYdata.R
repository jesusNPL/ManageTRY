
# Load the complete TRY database
load("TRYdata.RData")

# Load auxiliary functions
source("AuxiliaryFunctions/demonTraitMeanBySp.R")
source("AuxiliaryFunctions/demonTraitVARBySp.R")
source("AuxiliaryFunctions/godTRY.R")
source("AuxiliaryFunctions/demonCheckScinames.R")

##### Check your plant scientitic names according The Plant List (TPL) ######
# Before select your species in the TRY database, is possible that you need to check 
# if the scientific names are accepted or not. 
# The simple function "check_TPLScinames" will make the work for you. This function
# uses the awesome R package "Taxonstand". The function return a data.frame with five columns:
# [1] "UsedScinames" "Family"       "Genus"        "TPLSciname"   "Status" 
# The column TPLSciname contains the accepted scientific names of your species and you can
# use this new information as a vector to select your traits in the next step.

# You just need to enter a vector with your species names. Also, if you want to 
spp <- "a vector of scientific species names"

TPLspp <- check_TPLScinames(scinames = spp, saveResults = FALSE)

newspp <- as.character(TPLspp$TPLSciname)

##### Select traits by species #####
# This simple command lines will returned a subset of the TRY database for only your species

spp <- "a vector of scientific species names"

spps <- list()
for (species in 1:length(spp)) {
  svMisc::progress(species, max.value = length(spp))
  spps[[species]] <- TRYdata[which(TRYdata$AccSpeciesName == spp[species]), ]
  
}

spps <- do.call(rbind, spps)

# You can also save your data into a CSV for further exploration.
write.csv(spps, "your_file_name.csv")

##### Select traits by locations ####

# locs a a vector with the location ID accroding to TRY website 
locs <- "a vector of locations"

localities <- list()
for (loc in 1:length(locs)) {
  svMisc::progress(loc, max.value = length(locs))
  localities[[loc]] <- TRYdata[which(TRYdata$DatasetID == locs[loc]), ]
  
}

localities <- do.call(rbind, localities)
# You can also save your data into a CSV for further exploration.
write.csv(localities, "your_file_name.csv")

## NOTE: at this point you can erase the TRYdata of your R environment using rm(TRYdata) only to free memory in your computer, 
# but first you need to be sure that you extracted your needed information, either by species names, by localities or both.

##### calculate the Mean and sample Variance trait values ##### 
# The auxiliary function TraitMeanBySp will return a matrix with with species in ROWS and mean trait values in columns 
# You just need to inform the TRY subset by species, locations or both

MEANtriatSpecies <- TraitMeanBySp(spps)

VARtraitSpecies <- TraitVARBySp(spps)

# save your results
write.csv(MEANtriatSpecies, "your_file_name.csv")
write.csv(VARtriatSpecies, "your_file_name.csv")

# Also, you can load the subset that you saved in your computer, for example:

file <- "C:/Users/jpintole/Dropbox/TRY_DB/Sample_TraitsTRY.csv"

data <- read.table(file = file, sep = ',', h = T, na.strings = "", stringsAsFactor = FALSE, quote = "\"", comment.char = "")

MEANtriatSpecies <- TraitMeanBySp(data)

VARtraitSpecies <- TraitVARBySp(data)

# save your results
write.csv(MEANtriatSpecies, "your_file_name.csv")
write.csv(VARtraitSpecies, "your_file_name.csv")

TRYtraitIDs
