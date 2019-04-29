## run SC3 (http://bioconductor.org/packages/release/bioc/html/SC3.html)

library(SC3)

sce_k <- sc3_estimate_k(sce_sub)
sce_k <- as.numeric(unlist(metadata(sce_k)$sc3))
sce <- sc3(sce_sub, ks = sce_k, biology = FALSE, gene_filter = FALSE)

