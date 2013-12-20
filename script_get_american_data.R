############################################
# FIA data Script                          #
# Le 5 mars 2013                           #
# Rimouski                                 #
# Auteur: Camille Albouy et Steve Vissault #
############################################

setwd("/home/steve/Bureau/Data_state") 
getwd()

# Load file_name CSV file
File_names  <- read.csv2(file.choose(),header=FALSE)

system("mkdir Data_state") 
setwd("Data_state") 

##########################################################
getCSV <- function(X=state){
the.command <- paste("wget 'http://apps.fs.fed.us/fiadb-downloads/",X,"'",sep="") # reconstruction de l'URL a partir de la valeur de X
cat(the.command) 
system(the.command) 
} # end of function get CSV
##########################################################

for (i in 1:dim(File_names)[1]){
  getCSV(File_names[i,1])
  cat(i)
         }
  
##### Unzip files recently downloaded
system("for i in *.ZIP; do unzip $i;done")
 
