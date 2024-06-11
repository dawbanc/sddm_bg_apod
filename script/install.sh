#!/bin/sh

NASA_API_KEY=$1

# Check API Key
if [ $NASA_API_KEY = "INSERT_YOUR_API_KEY_HERE" ]; then
	echo -e "ERROR:  API KEY WAS NOT ENTERED\n\tPlease edit config in the project's directory with your API key before continuing."
	exit 1
fi;

echo -e "NASA API KEY: ${NASA_API_KEY}"

# Create directories for log and photo
mkdir -p /var/log/dynamic_sddm_bg
touch /var/log/dynamic_sddm_bg/dsb.log
chmod -R ugo+rw /var/log/dynamic_sddm_bg/dsb.log
mkdir -p /usr/share/dynamic_sddm_bg

# Copy over script files
cp script/dynamic_sddm_bg.sh /usr/share/dynamic_sddm_bg/dynamic_sddm_bg.sh
sed -i "s/NASA_API_KEY_PLACEHOLDER/${NASA_API_KEY}/g" /usr/share/dynamic_sddm_bg/dynamic_sddm_bg.sh
chmod +x /usr/share/dynamic/sddm_bg/dynamic_sddm_bg.sh

# Copy over temporary photo
cp theme/nasa_apod.jpg /usr/share/dynamic_sddm_bg/
chmod -R ugo+rw /usr/share/dynamic_sddm_bg/nasa_apod.jpg

# Copy over theme
cp -r theme /usr/share/sddm/themes/nasa_apod

# Request user to change theme
echo "Please go to your sddm settings and select 'NASA Astronomy Picture of the Day' "
read -n1 -s -r -p "Press any key to continue..."
echo ""

# Copy over service and start it
cp script/dynamic_sddm_bg.service /etc/systemd/system/dynamic_sddm_bg.service
echo "Enabling and starting service"
systemctl enable dynamic_sddm_bg.service
systemctl start dynamic_sddm_bg.service

# Done
echo "\n"
echo "sddm_bg_apod installed!"


