
extractByTrait <- function(tab, tid){
  t1 <- list()
  t2 <- list()
  for(p in 1:length(tid)){
    print(p)
    t1[[p]] <- tab[which(tab$TraitID == tid[p]), ]
    t2[[p]] <- t1[[p]][c(7, 10, 11, 15, 21)]
  }
  tmp <- do.call(rbind, t2)
}
