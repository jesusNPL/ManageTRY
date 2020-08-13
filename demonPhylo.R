### Arguments
# Spp = verctor of species names e.g., c(Elymus nutans, Festuca sinensis, Kobresia setschwanensis)
# scenarios = "S2" or "S3". Scenario S3 is recommended by Jian and Qian. 
# If S2 is selected a sample of trees will be returned, so you first need to inform the number of replicares, e.g., r = 100
# saveTaxonomy = Logic, True or False
# r = number of replicates, only if S2 is selected
# output.tree = Logic, True or False

demonPhyloPlants <- function(Spp, scenarios, saveTaxonomy, r, output.tree){
  if ( ! ("ape" %in% installed.packages())) {install.packages("ape", dependencies = T)}
  if ( ! ("remotes" %in% installed.packages())) {install.packages("remotes", dependencies = T)}
  if ( ! ("V.PhyloMaker" %in% installed.packages())) {remotes::install_github("jinyizju/V.PhyloMaker")}
  
  require(V.PhyloMaker)
  source("https://raw.githubusercontent.com/jesusNPL/ManageTRY/master/demonCheckScinames.R")
  
  taxonomy <- check_TPLScinames(Spp, saveTaxonomy = saveTaxonomy)
  data <- data.frame(species = taxonomy$TPLSciname, 
                     genus = taxonomy$TPLGenus, 
                     family = taxonomy$TPLFamily)
  if(scenarios == "S3"){
    YourPhylo <- phylo.maker(data, scenarios = "S3", output.tree = output.tree)
  } else if(scenarios == "S2"){
    YourPhylo <- phylo.maker(data, scenarios = "S2", output.tree = output.tree, r = r)
  }
  return(YourPhylo)
}
