install.packages("dplyr")
library("dplyr")

URL <- "https://raw.githubusercontent.com/gexijin/learnR/master/datasets/heartatk4R.txt"
heartatk4R <- read.table(URL,
                         header = TRUE, 
                         sep = "\t", 
                         colClasses = c("character", "factor", "factor", "factor", 
                                        "factor", "numeric", "numeric", "numeric"))
View(heartatk4R)
