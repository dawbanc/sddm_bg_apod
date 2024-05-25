all:
	@echo "Top level directives:"
	@echo "\tclean"
	@echo "\tinstall"
	@echo "\tuninstall"
	@echo "\ttest_theme"

clean:
	@rm -rf apod_theme.tar.gz
	@echo "Project cleaned!"

install:
	@# Create directories for log and photo
	mkdir -p /var/log/dynamic_sddm_bg
	mkdir -p /etc/dynamic_sddm_bg
	@# Copy over script files
	@# Copy over theme
	@echo "Please go to your sddm settings and select 'NASA Astronomy Picture of the Day' "
	@read -n1 -s -r -p "Press any key to continue..."
	@echo "\n"
	@echo "sddm_bg_apod installed!"

uninstall:
	@echo "Please switch to a different theme other than 'NASA Astronomy Picture of the Day' "
	@read -n1 -s -r -p "Press any key to continue..."
	@# Remove 
