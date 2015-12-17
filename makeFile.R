library(rmarkdown)
fileList <- list.files(pattern = ".Rmd$")
for (f in fileList) {
        render(input = f)
}
