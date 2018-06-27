

rm(list = ls())
getwd()
first=as.numeric(commandArgs(trailingOnly = TRUE)[2])
summary(rnorm(10,mean = first))
commandArgs(trailingOnly = T)