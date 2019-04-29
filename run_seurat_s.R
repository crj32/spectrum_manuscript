## run seurat (https://cran.r-project.org/web/packages/Seurat/index.html)

library(Seurat)

pbmc <- CreateSeuratObject(raw.data = datalist[[1]])
pbmc <- ScaleData(object = pbmc)
pbmc <- RunPCA(object = pbmc, pc.genes=row.names(datalist[[1]])) 
pbmc_c <- FindClusters(object = pbmc, reduction.type = "pca", dims.use = 1:10, 
                     resolution = 0.6, print.output = 0, save.SNN = TRUE)