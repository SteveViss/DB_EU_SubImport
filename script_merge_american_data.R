############################################
# FIA data Script                                                                                          #
# Monday April 11th 2014                                                                         #
# Rimouski                                                                                                   #
# Steve Vissault                                                                                           #
############################################

########### Merge each states into a unique CSV file.

library(stringr)

setwd("/Users/path/to/CSV_files/")

name_tables <- read.csv(file.choose()) # List on each table names (see table_names.csv)
list_csv <- list.files(getwd()) # List of every csv files folder.
dir.create(file.path(getwd(), "Ouputs")) # Create a folder for Ouputs

<<<<<<< HEAD
for (i in 1:dim(name_tables)[1]){
  match_list <- grep(name_tables[i,1], list_csv, value=TRUE) # list tables with the same name.
  cat(noquote(paste("Merging table:",name_tables[i,1],"\n",sep=" ")))
=======
for (i in 1:NROW(name_tables))
{
  match_list <- str_detect(name_tables[i,1], list_csv) # list tables with the same name.
  cat(str_c("Merge in progress for the table: ",name_tables[i,1]," \n"))
>>>>>>> c4b54166de09d0e2d96b3fe8443b9966d0a7a8c4
  cat("----------------------\n")
  for (y in 1:length(match_list))
  {
    cat(str_c("Source: ",substr(match_list[y],1,2)," \n"))
    output   <-  read.csv(match_list[y])
    if(y > 1 & y <= length(match_list))
    {
      output  <- rbind(output,read.csv(match_list[y]))
    }
    if(y==length(match_list))
    {
        write.csv(output,file=paste(getwd(),"/Ouputs/",name_tables[i,1],sep="")) # Write output (csv merged)
    }
  }
}





