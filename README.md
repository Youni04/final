## final 
## github username is youni04/final, docker is youni04/final

`output` contains the `project.html` after run code.
`R` contains `project.Rmd` and `plot.R`.
`data` contains the raw data file.
R package `matrixStats` need to be installed.
`Makefile` contains a `project.html`, a `figs.png` and a `help`


## Execute the analysis

To download the docker image, you can run 

``` 
docker pull youni04/final
```
## To do the analysis, you can run 
```
docker run -v path/to/output:/project/output -it youni04/final
```
in command line. The `path/to/output` should change to your local path for output.

## Or you can following code step by step to execute the analysis.
```
docker run -it youni04/final /bin/bash

cd project

make project.html
```
This will create a file called `project.html` output in your directory that contains the results.

 
## To build a docker image locally just run
```
make build
```
## Information of rules
```
make help
```





