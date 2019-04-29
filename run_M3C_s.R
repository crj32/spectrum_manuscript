## run M3C (https://bioconductor.org/packages/devel/bioc/html/M3C.html)

library(M3C)

res <- M3C(datalist[[1]],iters=10,clusteralg='pam',cores=1,
           removeplots=TRUE,silent=TRUE)
  
