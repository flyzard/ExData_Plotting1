# Create data directory inside the current directory
dir.create(file.path(".", "data"), showWarnings = FALSE)

# Download the data file if not downloaded yet
fileUrl = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
fileName = "exdata_data_household_power_consumption.zip"
dataPath = "./data"
dataFileNameZip = paste(dataPath, fileName, sep = "/")
if (!file.exists(dataFileNameZip)) {
  download.file(fileUrl, dataFileNameZip, mode = "wb")
}

dataFile = "household_power_consumption.txt"
# Unzip the file to data directory
extractedDataPath = paste(dataPath, dataFile, sep = "/")
if (!file.exists(extractedDataPath)) {
  unzip(paste(dataPath, fileName, sep = "/"), exdir = dataPath)
}

# Read data only within 2007-02-01 and 2007-02-02.
if (!exists("dataset")) {
  originalDataset = read.table(extractedDataPath, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
  dataset = originalDataset[originalDataset$Date %in% c("1/2/2007", "2/2/2007"),]
}
# To save memory, remove all objects except dataset
rm(list=setdiff(ls(), "dataset"))



