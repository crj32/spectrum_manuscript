## run SIMLR (https://bioconductor.org/packages/release/bioc/html/SIMLR.html)

library(SIMLR)

dd <- datalist[[1]]
x <- SIMLR_Estimate_Number_of_Clusters(dd)
NUMC = 2:10
optk <- NUMC[which.min(x$K1)]
done <- SIMLR(X=dd, c = optk, cores.ratio = 0)
group <- done$y$cluster

