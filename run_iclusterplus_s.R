## run iClusterPlus (https://bioconductor.org/packages/release/bioc/html/iClusterPlus.html)

library(iClusterPlus)

fit.single <- iClusterPlus(dt1=t(datalist[[1]]),dt2=t(datalist[[2]]),dt3=t(datalist[[3]]),
                        type=c("gaussian","gaussian","gaussian"),
                        K=2,maxiter=10)