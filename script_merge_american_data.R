############################################
# FIA data Script                          #
# Monday August 12th 2013                  #
# Rimouski                                 #
# Auteur: Steve Vissault                   #  
############################################

########### Merge each table name to one CSV file. 

setwd("/Users/path/to/CSV_files/")

name_tables <- read.csv(file.choose()) # List on each table names (see file_names_group.csv)
list_csv <- list.files(getwd()) # List of every csv files folder. 
dir.create(file.path(getwd(), "Ouputs")) # Create a folder for Ouputs

for (i in 1:dim(name_tables)[1]){
  match_list <- grep(name_tables[i,1], list_csv, value=TRUE) # list tables with the same name.
  cat(noquote(paste("Merge in progress for the table:",name_tables[i,1],"\n",sep=" ")))
  cat("----------------------\n")
  for (y in 1:length(match_list)){
    cat(noquote(paste("Source:",substr(match_list[y],1,2),"\n",sep=" ")))
          output   <-  read.csv(match_list[y])
        if(y > 1 & y <= length(match_list)){
          output  <- rbind(output,read.csv(match_list[y]))
        }
        if(y==length(match_list)){
          write.csv(output,file=paste(getwd(),"/Ouputs/",name_tables[i,1],sep="")) # Write output (csv merged)
  }
}





