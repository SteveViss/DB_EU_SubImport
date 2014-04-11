STATES = AL AZ AR CA CO CT
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


