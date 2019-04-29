library(Spectrum)
library(survival)
library(igraph)

## RNA-seq

r <- Spectrum(thyroid[[1]])

clinicali <- thyroid[[2]]
clinicali$Death <- as.numeric(as.character(clinicali$Death))
coxFit <- coxph(Surv(time = Time, event = Death) ~ as.factor(r$assignments), data = clinicali, ties = "exact")
coxresults <- summary(coxFit)
print(coxresults$logtest[3])

## multi-omics

r <- Spectrum(thyroid)

clinicali <- clinical_thyroid
clinicali$Death <- as.numeric(as.character(clinicali$Death))
coxFit <- coxph(Surv(time = Time, event = Death) ~ as.factor(r$assignments), data = clinicali, ties = "exact")
coxresults <- summary(coxFit)
print(coxresults$logtest[3])

## single cell RNA-seq

# smaller datasets
r <- Spectrum(darmanis[[1]])
NMIi <- compare(as.numeric(r$assignments),
                as.numeric(as.factor(darmanis[[2]])),method='nmi') # diff lengths atm
print(NMIi)

# bigger datasets
r <- Spectrum(darmanis[[1]],FASP=TRUE,FASPk=900)
NMIi <- compare(as.numeric(r$assignments),
                as.numeric(as.factor(darmanis[[2]])),method='nmi') # diff lengths atm
print(NMIi)