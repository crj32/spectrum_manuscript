library(Spectrum)
library(survival)
library(igraph)

## Spectrum: RNA-seq

r <- Spectrum(bladder[[1]])

# do log-rank

clinicali <- bladder[[2]]
clinicali$Death <- as.numeric(as.character(clinicali$Death))
coxFit <- coxph(Surv(time = Time, event = Death) ~ as.factor(r$assignments), data = clinicali, ties = "exact")
coxresults <- summary(coxFit)
print(coxresults$logtest[3])

## Spectrum: multi-omics

r <- Spectrum(bladder)

# do log-rank

clinicali <- clinical_bladder
clinicali$Death <- as.numeric(as.character(clinicali$Death))
coxFit <- coxph(Surv(time = Time, event = Death) ~ as.factor(r$assignments), data = clinicali, ties = "exact")
coxresults <- summary(coxFit)
print(coxresults$logtest[3])

## Spectrum: single cell RNA-seq

# smaller datasets

r <- Spectrum(darmanis[[1]])

# get NMI

NMIi <- compare(as.numeric(r$assignments),
                as.numeric(as.factor(darmanis[[2]])),method='nmi') # diff lengths atm
print(NMIi)

# bigger datasets

r <- Spectrum(darmanis[[1]],FASP=TRUE,FASPk=900)

# get NMI

NMIi <- compare(as.numeric(r$assignments),
                as.numeric(as.factor(darmanis[[2]])),method='nmi') # diff lengths atm
print(NMIi)
