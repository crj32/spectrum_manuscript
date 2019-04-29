# run pinsplus (https://cran.r-project.org/web/packages/PINSPlus/index.html)

library(PINSPlus)

if (length(mylist == 1)){
  t <- PerturbationClustering(mylist[[1]])
}else if (length(mylist) > 1){
  t <- SubtypingOmicsData(dataList=mylist)
}

