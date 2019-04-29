## run MUDAN (https://github.com/JEFworks/MUDAN)

library(MUDAN)

com.graph <- getComMembership(t(datalist[[1]]),k=30)
group <- com.graph
