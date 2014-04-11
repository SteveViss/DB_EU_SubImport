############################################
# FIA data Script                          #
# Le 5 mars 2013                           #
# Rimouski                                 #
# Auteur: Camille Albouy et Steve Vissault #
############################################

library(stringr)
library(httr)

setwd("/home/steve/Bureau/Data_state") 
getwd()

# Load file_name CSV file
File_names  <- read.csv2(file.choose(),header=FALSE)

if (file.exists("Data_state")){
    setwd(file.path(getwd(), "Data_state"))
} else {
    dir.create(file.path(getwd(), "Data_state"))
    setwd(file.path(getwd(), "Data_state"))
}

##########################################################
getCSV <- function(X=state) return(httr::GET(str_c("http://apps.fs.fed.us/fiadb-downloads/",X))$content)
##########################################################

for (i in 1:dim(File_names)[1]){
  getCSV(File_names[i,1])
  cat(i)
}
  
##### Unzip files recently downloaded
system("for i in *.ZIP; do unzip $i;done")
