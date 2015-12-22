# library of functions to be used in "making" the blog
# Daniel Szulc
# daniel.szulc@intelligence-data.net

generatePostLinks <- function(n = 10000) {
        mainURL <- "http://danielszulc.intelligence-data.net/" # constant
        posts <- rev(getPostList())  # rev to obtain reverse chronological order
        n <- min(n, length(posts))
        posts <- posts[1:n]
        for (p in posts) {
                html <- sub(".Rmd$",".html", p)
                html <- paste0(mainURL,html)
                link <- paste0('<h4><a href="',html,'">',extractTitle(p),'</a></h4>')
                #print(link,quote = FALSE,)
                cat(link)
        }
        
}

extractTitle <-function(file) {
        lines <- readLines(file)
        title <- yaml::yaml.load(lines[2])
        title$title
        
}

getPostList <- function() {
        posts <- list.files(pattern = "^[0-9].*.Rmd")
        posts
}