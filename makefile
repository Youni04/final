## project.html  : Generate final analysis report.
# rule for making report  
project.html: data/AID_743085_datatable_all.csv R/project.rmd 
	Rscript -e "rmarkdown::render('R/project.Rmd', output_file = '../output/project.html')"

## Plots of analysis
figs.png: R/plot.R data/AID_743085_datatable_all.csv
	Rscript R/plot.R 

## install: packages that need to be installed 
# rule for install
install:
	Rscript -e 'install.packages("matrixStats", repo = "https://lib.ugent.be/CRAN/")'

## build : Builds the docker image
.PHONY: build
build: Dockerfile
	docker build -t final .

## help:  help information
# rule for help
.PHONY: help
help: Makefile
	@sed -n 's/^##//p' $<



