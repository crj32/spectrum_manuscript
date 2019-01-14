# kidney

# data obtained from: http://gdac.broadinstitute.org/

# miRNAseq

miRNAseq <- read.csv('KIRC.mirnaseq__illuminahiseq_mirnaseq__bcgsc_ca__Level_3__miR_gene_expression__data.data.txt',sep='\t')
row.names(miRNAseq) <- miRNAseq[,1]
miRNAseq <- miRNAseq[,-1]
df <- miRNAseq
cols <- colSums(mapply('==', 'read_count', df))
new.df <- df[,which(cols == 0)]
cols <- colSums(mapply('==', 'cross-mapped', new.df))
new.df <- new.df[,which(cols == 0)]
cols <- colSums(mapply('==', 'N', new.df))
new.df <- new.df[,which(cols == 0)]
new.df <- new.df[-1,]
myvec <- colnames(new.df)
n <- 3
colnames(new.df) <- vapply(strsplit(myvec, '\\.'), function(x) paste(x[seq.int(n)], collapse='.'), character(1L))
miRNAseq <- new.df
miRNAseq[] <- lapply(miRNAseq, function(x) as.numeric(as.character(x)))

# filter for variance

miRNAseq <- log2(miRNAseq+2)
CV <- apply(miRNAseq,1,sd)/(rowMeans(miRNAseq)) 
names <- names(CV)[CV>as.numeric(quantile(CV)[4])]
miRNAseq <- subset(miRNAseq, row.names(miRNAseq) %in% names)

# mRNAseq

RNAseq <- read.csv('KIRC.rnaseqv2__illuminahiseq_rnaseqv2__unc_edu__Level_3__RSEM_genes_normalized__data.data.txt',sep='\t')
row.names(RNAseq) <- RNAseq[,1]
RNAseq <- RNAseq[,-1]
df <- RNAseq
cols <- colSums(mapply('==', 'scaled_estimate', df))
new.df <- df[,which(cols == 0)]
cols <- colSums(mapply('==', 'transcript_id', new.df))
new.df <- new.df[,which(cols == 0)]
RNAseq <- new.df[-1,]
myvec <- colnames(RNAseq)
n <- 3
colnames(RNAseq) <- vapply(strsplit(myvec, '\\.'), function(x) paste(x[seq.int(n)], collapse='.'), character(1L))
RNAseq[] <- lapply(RNAseq, function(x) as.numeric(as.character(x)))
RNAseq <- RNAseq[complete.cases(RNAseq), ]

# filter for variance

RNAseq <- log2(RNAseq+2)
CV <- apply(RNAseq,1,sd)/(rowMeans(RNAseq)) 
names <- names(CV)[CV>as.numeric(quantile(CV)[4])]
RNAseq <- subset(RNAseq, row.names(RNAseq) %in% names)

# protein

protein <- read.csv('KIRC.protein_exp__mda_rppa_core__mdanderson_org__Level_3__protein_normalization__data.data.txt',sep='\t')
protein <- protein[-1,]
row.names(protein) <- protein[,1]
protein <- protein[,-1]
myvec <- colnames(protein)
n <- 3
colnames(protein) <- vapply(strsplit(myvec, '\\.'), function(x) paste(x[seq.int(n)], collapse='.'), character(1L))
protein[] <- lapply(protein, function(x) as.numeric(as.character(x)))

protein <- protein[complete.cases(protein), ]
CV <- apply(protein,1,sd)/(rowMeans(protein)) 
names <- names(CV)[CV>as.numeric(quantile(CV)[4])]
protein <- subset(protein, row.names(protein) %in% names)

# clinical

clinical <- read.csv('KIRC.clin.merged.picked.txt',sep='\t')
clinical <- data.frame(t(clinical))
colnames(clinical) <- as.character(unname(unlist(clinical[1,])))
clinical <- clinical[-1,]
row.names(clinical) <- toupper(row.names(clinical))
clinical$days_to_death <- as.numeric(as.character(clinical$days_to_death))
clinical$days_to_last_followup <- as.numeric(as.character(clinical$days_to_last_followup))
clinical$days_to_death[is.na(clinical$days_to_death)] <- clinical$days_to_last_followup[is.na(clinical$days_to_death)]
clinical <- clinical[c('vital_status','days_to_death')]
colnames(clinical) <- c('Death','Time')

# make a list of data and write the object

kidneyrenalclearcell <- list(RNAseq=RNAseq,miRNAseq=miRNAseq,protein=protein,clinical=clinical)
rm(list=setdiff(ls(), "kidneyrenalclearcell"))

