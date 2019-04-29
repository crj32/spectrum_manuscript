## run CIMLR (https://github.com/danro9685/CIMLR)

library(CIMLR)

res2 <- CIMLR_Estimate_Number_of_Clusters(mylist2, NUMC = 2:10, cores.ratio = 1)
res <- CIMLR(X=mylist2, c = which.min(res2$K1)+1, cores.ratio = 0)

