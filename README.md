# Forest Inventory and Analysis National Program Database

Data are provide by the Forest Inventory and Analysis National Program and available publicly [here](http://apps.fs.fed.us/fiadb-downloads/datamart.html). 

This procedure allows to download zip files, unzip them and merge every csv files (classified by individual state) to one complete file for the United-States. 

**Details of data files and files process via R and shell commands :**

- `Table_names.csv`: name of each FIA tables 
- `script_get_american_data.R`: Script R for import and merge files data
