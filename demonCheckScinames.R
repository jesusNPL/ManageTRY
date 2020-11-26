
# Function that uses the AWESOME R package "Taxonstand" to retrieve
# the accepted scientific names according The Plant List (TPL)
# The function return a data.frame with five columns:
# [1] "UsedScinames" "Family"       "Genus"        "TPLSciname"   "Status" 
# Where UsedScinames is the names that you entered 

# Usage:
# scinames: a vector with scientific names that you need or want to check in the TPL
# saveResults: logical if TRUE, a data.frame with the returned information will be 
# saved in your working directory

check_TPLScinames <- function(scinames, saveTaxonomy = FALSE, infra = TRUE){
  if ( ! ("Taxonstand" %in% installed.packages())) {install.packages("Taxonstand", dependencies = T)}
  if ( ! ("svMisc" %in% installed.packages())) {install.packages("svMisc", dependencies = T)}
  #require(Taxonstand)
  spnames <- list()
  for(names in 1:length(scinames)){
    cat(names, '\n')
    print(scinames[names])
    #svMisc::progress(names, max.value = length(scinames))
    spnames[[names]] <- Taxonstand::TPLck(sp = scinames[names], corr = TRUE, max.distance = 3, 
                              version = "1.1", infra = infra)
    
  }
  spnames <- do.call(rbind, spnames)
  newgen <- spnames$New.Genus
  newspp <- spnames$New.Species
  newsciname <- paste(newgen, newspp, sep = " ")
  checkspp <- data.frame(spnames$Taxon, spnames$Family, spnames$New.Genus, newsciname,
                         spnames$New.Taxonomic.status)
  colnames(checkspp) <- c("UsedScinames", "TPLFamily", "TPLGenus", "TPLSciname", "Status")
  if(saveTaxonomy == TRUE)
  {
  write.csv(checkspp, "Scinames_check_in_TPL.csv")
  }
  return(checkspp)
}

