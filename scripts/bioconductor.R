rm(list = ls())

source("https://bioconductor.org/biocLite.R")
biocLite("DESeq2")
biocLite("Biostrings")
biocLite("BiocFileCache")
biocLite("SingleCellExperiment")
biocLite("GenomeInfoDb")
biocLite("GenomeInfoDbData")
install.packages("GenomeInfoDbData")
library(GenomeInfoDb)
biocLite("TENxBrainData")

biocLite("GenomeInfoDbData")
biocLite("GenomeInfoDb")
install.packages("GenomeInfoDbData", repos = "	http://bioconductor.org/packages/GenomeInfoDbData/", type="source")


## biocLite("GenomicRanges")
GRanges

helloranges; plyrRanges


url <- "https://scrnaseq-public-datasets.s3.amazonaws.com/scater-objects/manno_mouse.rds"
fl <- BiocFileCache::bfcrpath(rnames = url)

sce <- readRDS(fl)
sce <- readRDS("manno_mouse.rds")


install.packages('TENxBrainData')


lapply(1:5, function(i) { Sys.sleep(1); 1})
library(BiocParallel)
param = SnowParam(5)
bpstart(param)
x2 <- bplapply(1:5, function(i) {Sys.sleep(1); i }, BPPARAM = param)
system.time(x2 <- bplapply(1:5, function(i) {Sys.sleep(1); i }, BPPARAM = param))


param = MulticoreParam(5)
bpstart(param)


param = BatchtoolsParam(20, cluster = "sge")



X = list(1, 2, "three", 4)
fun = function(i) sqrt(i)
lapply(X, fun)  
(result = bptry(bplapply(X, fun, BPPARAM = param)))
(result = bplapply(X, fun, BPPARAM = SerialParam(), BPREDO = result)) # run calculation locally and use debug() and undebug()

options(error = recover) # type NULL to go back