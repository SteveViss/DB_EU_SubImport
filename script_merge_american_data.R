############################################
# FIA data Script                          #
# Monday August 12th 2013                  #
# Rimouski                                 #
# Auteur: Steve Vissault                   #  
############################################

########### Merge each table (e.g. Boundaries.CSV) to one CSV file for the entire study area. 

setwd("/Users/path/to/CSV_files/")

name_tables <- read.csv(file.choose()) # List contained each tables name (see file_names_group.csv as example)
list_csv <- list.files(getwd()) # List of every csv files containing in a specific folder. Create a folder with every csv files for each state you want to merge (by table).
dir.create(file.path(getwd(), "Ouputs")) # Create a folder for Ouputs

for (i in 1:dim(name_tables)[1]){
  match_list <- grep(name_tables[i,1], list_csv, value=TRUE) # Find every tables with the same name from the list_csv.
  cat(noquote(paste("Merge in progress for the table:",name_tables[i,1],"\n",sep=" ")))
  cat("----------------------\n")
  for (y in 1:length(match_list)){
    cat(noquote(paste("Source:",substr(match_list[y],1,2),"\n",sep=" ")))
          output   <-  read.csv(match_list[y])
        if(y > 1 & y <= length(match_list)){
          output  <- rbind(output,read.csv(match_list[y]))
        }
        if(y==length(match_list)){
          write.csv(output,file=paste(getwd(),"/Ouputs/",name_tables[i,1],sep="")) # Write output (csv merged) in the "outputs" folder
        }
  }
}





