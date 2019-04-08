# process single cell expression datasets

# .rds objects/ datasets were obtained from: https://hemberg-lab.github.io/scRNA.seq.datasets/

if (dataset == 'camp1'){
  library(SingleCellExperiment)
  camp1 <- readRDS('C:/Users/chris/Desktop/singlecellcollection/camp1.rds')
  td <- assay(camp1)
  vars <- rowVars(td)
  names(vars) <- rownames(camp1)
  vars <- sort(vars, decreasing = TRUE)
  sce_sub <- camp1[names(vars[1:100]),]
  t <- assay(sce_sub)
  t <- data.frame(t)
  datalist <- list(t)
  meta <- colData(camp1)
  celltypes <- meta$cell_type1
  length(unique(celltypes))
  dim(t)
}

if (dataset == 'darmanis'){
  library(SingleCellExperiment)
  camp1 <- readRDS('C:/Users/chris/Desktop/singlecellcollection/darmanis.rds')
  td <- assay(camp1,'logcounts')
  vars <- rowVars(td)
  names(vars) <- rownames(camp1)
  vars <- sort(vars, decreasing = TRUE)
  sce_sub <- camp1[names(vars[1:100]),]
  t <- assay(sce_sub,'logcounts')
  t <- data.frame(t)
  datalist <- list(t)
  meta <- colData(camp1)
  celltypes <- meta$cell_type1
  length(unique(celltypes))
  dim(t)
}

if (dataset == 'li'){
  library(SingleCellExperiment)
  camp1 <- readRDS('C:/Users/chris/Desktop/singlecellcollection/li.rds')
  td <- assay(camp1,'logcounts')
  vars <- rowVars(td)
  names(vars) <- rownames(camp1)
  vars <- sort(vars, decreasing = TRUE)
  sce_sub <- camp1[names(vars[1:100]),]
  t <- assay(sce_sub,'logcounts')
  t <- data.frame(t)
  datalist <- list(t)
  meta <- colData(camp1)
  celltypes <- meta$cell_type1
  length(unique(celltypes))
  dim(t)
}

if (dataset == 'patel'){
  library(SingleCellExperiment)
  camp1 <- readRDS('C:/Users/chris/Desktop/singlecellcollection/patel.rds')
  td <- assay(camp1,'logcounts')
  vars <- rowVars(td)
  names(vars) <- rownames(camp1)
  vars <- sort(vars, decreasing = TRUE)
  sce_sub <- camp1[names(vars[1:100]),]
  t <- assay(sce_sub,'logcounts')
  t <- data.frame(t)
  datalist <- list(t)
  meta <- colData(camp1)
  celltypes <- meta$cell_type1
  length(unique(celltypes))
  dim(t)
}

if (dataset == 'pollen'){
  library(SingleCellExperiment)
  camp1 <- readRDS('C:/Users/chris/Desktop/singlecellcollection/pollen.rds')
  td <- assay(camp1,'logcounts')
  vars <- rowVars(td)
  names(vars) <- rownames(camp1)
  vars <- sort(vars, decreasing = TRUE)
  sce_sub <- camp1[names(vars[1:100]),]
  t <- assay(sce_sub,'logcounts')
  t <- data.frame(t)
  datalist <- list(t)
  meta <- colData(camp1)
  celltypes <- meta$cell_type1
  length(unique(celltypes))
  dim(t)
}

if (dataset == 'baron'){
  library(SingleCellExperiment)
  baron <- readRDS('C:/Users/chris/Desktop/singlecellcollection/baron-human.rds')
  td <- assay(baron,'logcounts')+1
  vars <- rowVars(td)
  names(vars) <- rownames(baron)
  vars <- sort(vars, decreasing = TRUE)
  sce_sub <- baron[names(vars[1:100]),]
  t <- log2(assay(sce_sub)+1)
  t <- data.frame(t)
  datalist <- list(t)
  meta <- colData(baron)
  celltypes <- meta$cell_type1
  length(unique(celltypes))
  dim(t)
}

if (dataset == 'muraro'){
  library(SingleCellExperiment)
  camp1 <- readRDS('C:/Users/chris/Desktop/singlecellcollection/muraro.rds')
  td <- assay(camp1,'logcounts')
  vars <- rowVars(td)
  names(vars) <- rownames(camp1)
  vars <- sort(vars, decreasing = TRUE)
  sce_sub <- camp1[names(vars[1:100]),]
  t <- assay(sce_sub,'logcounts')
  t <- data.frame(t)
  datalist <- list(t)
  meta <- colData(camp1)
  celltypes <- meta$cell_type1
  length(unique(celltypes))
  dim(t)
}