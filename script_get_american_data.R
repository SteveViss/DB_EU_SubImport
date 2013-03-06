####################
# FIA data Script  #
# Le 5 mars 2013   #
# Rimouski         #
# Auteur: Camille  #
####################

setwd("") #Configurer l'emplacement des données 
getwd()

# Chargement des données
File_names  <- read.csv2(file.choose(),header=FALSE)

# il s'agit d'un fichier ou tu as tout les noms des fichiers présents sur le site j'ai fais ca en shell et avec quelque bidouille de remplacement de carctèrs mais on s'en fou....

system("mkdir Data_state") # créer un repértoire pour stocker les données
setwd("Data_state") # je me place dans le répértoire

# state <- c("AZ","CO","ID","MT","NM","NV","WY","UT","AK","CA","HI","OR","WACT","DE","IA","IL","IN","KS","MA","MD","ME","MI","MN","MO","ND","NE","NH","NJ","NY","OH","PA","RI","SD","VT","WI","WV","AL","AR","FL","GA","KY","LA","MS","NC","OK","SC","TN","TX","VA") # les noms des variables ici les états
# state <- paste(state,".ZIP",sep="")
# state <- as.data.frame(state)

#IL faut charger l'ensemble de la fonction dans ta console R
##########################################################
#### Création d'une fonction qui va chercher les csv à partir de l'url ####
# Argument X du texte

getCSV <- function(X=state){

the.command <- paste("wget 'http://apps.fs.fed.us/fiadb-downloads/",X,"'",sep="") # reconstruction de l'URL a partir de la valeur de X
cat(the.command) # pour afficher l'url que l'ordi affiche
system(the.command) # executer la commande par le système
} # end of function get CSV
##########################################################

un exemple pour AL_BOUNDARY.ZIP

getCSV(Files_names[1,1]) # la tu viens de récupérer le fichier

# Et maintenant on applique la fonction pour tout les fichiers
 sapply(File_names,getCSV) #pour chaque éléments de File_names on applique la fonction getCSV
  
##### Deuxième étape une fois les fichiers télécharger tu veux les dézipper
system("for i in *.ZIP; do unzip $i;done")
 

########### Fusion des fichiers en plusieurs sous-tables pour le pays au complet 

getwd()
setwd("/home/steve/Bureau/Data_state")

name_table <- read.csv(file.choose()) # Fichier avec le nom pour chaque table
list_files <- list.files("/home/steve/Bureau/Data_state") # Nom des fichiers dans le dossier cible avec les fichiers extraits du ZIP

for (i in 1:length(name_table)){
  match_list <- as.list(grep(name_table[i], list_files, value=TRUE)) #Fait la liste de tous les fichiers contenant la chaine de caractère en i (name_table) dans la liste "list_files" 
  print(name_table)
  
  for (y in 1:length(match_list)){
    
    name <- paste("output",y,sep="") # Nom de la sortie
    path <- paste("/home/steve/Bureau/Data_state", match_list[y], sep="/") # Chemin des fichiers correspondant à la chaine de caractères
    
    print(paste(name_table[i],"- File:",y,"/",length(match_list), sep=" "))
    
  assign(name,read.csv(path,header=TRUE)) # création du dataframe avec comme nom la variable "name"

  }
  
  outputs <- lapply(grep("output",names(which(sapply(.GlobalEnv, is.data.frame))), value = TRUE),get) # Assemble les objets outputs
  ls_output <- as.list(grep("output",names(which(sapply(.GlobalEnv, is.data.frame))), value = TRUE)) # Fait la liste des objets output pour les retirer plus tard
  
  name_merge <- paste(name_table[i],"_Final_merging", sep="")
  assign(name_merge,do.call(rbind, outputs)) #Réalise la fusion de tous les outputs dans un fichier "_Final_merging" correspondant au fichier à intégrer dans la base de données.
  do.call(rm,ls_output)
}


