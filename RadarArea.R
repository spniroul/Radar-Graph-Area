getwd()
setwd("SET DIRECTORY HERE IF NECESSARY")

#Loading the csv dataset containing radar graph variables
data <- read.csv("input-file.csv")

# Define the function to calculate area
radar_area <- function(data) {
  vals <- data[, -1, drop=FALSE] # assume the first column is the row identification like ID, Name, etc.
  first <- 1:ncol(vals)
  second <- c(first[-1], first[1])
  Reduce(`+`, Map(function(i, j) vals[,i] * vals[,j], first, second))/2 * sin(2*pi/ncol(vals))
}

#Exporting the calculated area for each radar graph
area <- radar_area(data)
print(area)
write.csv(area, file = "arearadar.csv")
