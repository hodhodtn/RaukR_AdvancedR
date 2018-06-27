rm(list = ls())

devtools::install_version("GenABEL.data", version = "1.0.0", repos = "http://cran.us.r-project.org")

devtools::install_version("GenABEL", version = "1.8-0", repos = "http://cran.us.r-project.org")

library(GenABEL)

data = load.gwaa.data(phenofile = "data/GWAS/phenotype.dat", genofile = "data/GWAS/genotype.raw")
class(data)

gtdata = data@gtdata
nsnps(gtdata)
nids(gtdata)
as.character(gtdata[27, 5:7])
summ = summary(gtdata[,1:5])         # Q.2 minor allele frequency
library(ggplot2)
plot(summ$Q.2)


pheno = data@phdata
summary(pheno)
table(pheno[,2:3])

# QC

qc1 = check.marker(data = data, callrate = 0.95, perid.call = 0.95, maf = 0.05, hweidsubset = pheno$pheno == 0)
summary(qc1)
str(qc1)
data.clean = data[qc1$idok, qc1$snpok]
nids(data.clean)

autoMark = autosomal(data.clean)     # it recognises it for humans, other species require changes in the checks
gkin = ibs(data.clean[, autoMark], weight = 'freq')
data.clean[1,1:4]
gdm = as.dist(0.5 - gkin)
mds = cmdscale(gdm)
plot(mds, col=pheno$sex, pch=20)


an = qtscore(formula = pheno ~ 1 + sex, data.clean, trait.type = "binomial")
sum(is.na(data.clean@phdata$pheno))
plot(an)
summary(an)
estlambda(an[, 'P1df'], plot = TRUE)


??mmscore

h2h = polygenic(pheno ~ sex, kinship.matrix = gkin, data = data.clean, llfun = 'polylik')
mm = mmscore(h2object = h2h, data = data.clean,clambda = TRUE)
plot(mm)
