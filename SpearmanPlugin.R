p_value <- 0.05;
libs <- c("Hmisc");
lapply(libs, require, character.only=T);

input <- function(inputfile) {
  pc <<- read.csv(inputfile, header = TRUE);
}


run <- function() {
  cn <<- colnames(pc);
  cn <<- cn[2:length(cn)];
  pc <<- pc[,-1];
  pc <<- apply(pc, 1, as.numeric);
  pc <<- t(pc);
  correlations <<- rcorr(pc[,], type=c("spearman"));
  pc <<- as.matrix(correlations$r);
  pc[is.na(pc)] <<- 0;
  empty <- c("");
  #pc[which(correlations$P>p_value)] <<- 0;
}

output <- function(outputfile) {
   if (!(endsWith(outputfile, ".unthresholded.csv"))) {
      # Assume unthresholded in this case
      pc[which(correlations$P>p_value)] <<- 0;
   }
   write.table(pc, file=outputfile, sep=",", append=FALSE, row.names=unlist(cn), col.names=unlist(cn), na="");
}


