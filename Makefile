include config
DATE=${date +%Y%m%d_%H%M}

all:
	@echo -e "Top level directives:"
	@echo -e "\t- install"
	@echo -e "\t- uninstall"
	@echo -e "\t- reinstall"
	@echo -e "\t- reset_script"
	@echo -e "\t- test_download"

install:
	script/install.sh ${NASA_API_KEY}

uninstall:
	script/uninstall.sh

reinstall: uninstall install reset_script

test_download:
	script/test_download.sh ${NASA_API_KEY}
	
reset_script:
	rm /usr/share/dynamic_sddm_bg/status
	touch /usr/share/dynamic_sddm_bg/status
