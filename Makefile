include config

all:
	@echo -e "Top level directives:"
	@echo -e "\t- clean"
	@echo -e "\t- install"
	@echo -e "\t- uninstall"

clean:
	@rm -rf apod_theme.tar.gz
	@echo "Project cleaned!"

install:
	script/install.sh ${NASA_API_KEY}

uninstall:
	script/uninstall.sh

