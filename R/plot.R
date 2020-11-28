#! /usr/bin/Rscript

# get environment variable to determine which figure to make

df <- read.csv("../data/AID_743085_datatable_all.csv",header = FALSE)
data<-df[7:10492, c(2,28:40,42:43,68:80,82:83,107:119,121:122)]

## Summary
#Some plots of the dose-response curve are shown below.


obs<-matrix(nrow = 1,ncol = 15)
A <- matrix(nrow = 3,ncol = 15)
obs_all <- NULL
for (i in 1:10486) {
  A<-matrix(as.numeric(data[i,2:46]),nrow=3,ncol = 15)
  obs<-matrix(colMeans(A,na.rm =TRUE),nrow = 1,ncol = 15)
  obs_all <- cbind(obs_all,obs)
}

average_value <- matrix(obs_all,ncol = 10486,nrow = 15)
conc<-df[6,c(28:40,42:43)]

conc_num<-as.numeric(conc)

png("figs/figs.png")
	plot(log10(conc_num),average_value[,1], xlab = "concentration", ylab = "resposnse")
	plot(log10(conc_num),average_value[,2], xlab = "concentration", ylab = "resposnse")
	
	
dev.off()
