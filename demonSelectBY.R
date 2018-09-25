
#spp <- "a vector of species"

selecBYspp <- function(spp, saveResults = TRUE){
  spp <- list()
  for (species in 1:length(spp)) {
  svMisc::progress(species, max.value = length(spp))
  spp[[species]] <- TRYdata[which(TRYdata$AccSpeciesName == spp[species]), ]
  }
  spp <- do.call(rbind, spp)
  if(saveResults == TRUE){
    write.csv(spp, "TraitsBYspecies.csv")
  }
  return(spp)
}


# locs is a vector with the location ID accroding to TRY website 
#localities <- "a vector of locations"

selectBYlocation <- function(localities, saveResults = TRUE){
  localities <- list()
  for (loc in 1:length(localities)) {
  svMisc::progress(loc, max.value = length(localities))
  localities[[loc]] <- TRYdata[which(TRYdata$DatasetID == localities[loc]), ]
  }
  localities <- do.call(rbind, localities)
  if(saveResults == TRUE){
  write.csv(localities, "TraitsBYlocations.csv")
  }
  return(localities)
}

