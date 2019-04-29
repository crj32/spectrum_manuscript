## run SNF (https://cran.r-project.org/web/packages/SNFtool/index.html)

library(SNF)

K = 20 # number of neighbors, usually (10~30)
alpha = 0.5   # hyperparameter, usually (0.3~0.8)
T = 20  # Number of Iterations, usually (10~20)

# make affinities
myaffinities <- list()
for (i in seq(1,length(datalist))){
  Dist1 = (dist2(as.matrix(mylist2[[i]]),as.matrix(mylist2[[i]])))^(1/2)
  W1 = affinityMatrix(Dist1, K, alpha)
  myaffinities[[i]] <- W1
}

# get optimal K
if (length(myaffinities) >= 2){
  W = SNF(myaffinities, K, T)
  estimates <- estimateNumberOfClustersGivenGraph(W, NUMC=2:10)
  optk <- estimates$`Eigen-gap best`
  print(optk)
}else{
  W <- myaffinities[[1]]
  estimates <- estimateNumberOfClustersGivenGraph(W, NUMC=2:10)
  optk <- estimates$`Eigen-gap best`
  print(optk)
}
C = optk

# do spectral clustering using optimal k
group = spectralClustering(W,C)



