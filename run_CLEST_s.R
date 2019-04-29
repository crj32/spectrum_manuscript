## run CLEST (https://cran.r-project.org/web/packages/RSKC/index.html)

library(RSKC)

k <- Clest(t(datalist[[1]]),5,alpha=0,B=3,B0=10,beta=0.05,nstart=10,
                 pca=TRUE,L1=NULL,silent=TRUE)
kmres <- kmeans(t(datalist[[1]]),centers=k$K)
