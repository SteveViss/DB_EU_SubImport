STATES =  AL AK AZ AR CA CO CT DE FL GA HI ID IL IN IA KS KY LA ME MD MA MI MN MS MO MT NE NV NH NJ NM NY NC ND OH OK OR PA RI SC SD TN TX UT VT VA WA WV WI WY
ZIPFILES = $(patsubst %, %.zip, $(STATES))
DL = wget
DATA = Data_state
DUMP = Zip_files

.PHONY: directories

all: directories $(ZIPFILES)

directories: $(DATA) $(DUMP)

$(DATA):
	mkdir -p $(DATA)

$(DUMP):
	mkdir -p $(DUMP)

$(ZIPFILES):
	$(DL) http://apps.fs.fed.us/fiadb-downloads/$@
	touch $@
	mv $@ $(DATA)
	cd $(DATA); unzip $@; \
		mv $@ ../$(DUMP)


