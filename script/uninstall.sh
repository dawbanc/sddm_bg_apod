# Ask user to switch to a different theme
echo "Please switch to a different theme other than 'NASA Astronomy Picture of the Day' "
read -n1 -s -r -p "Press any key to continue..."
echo ""

# stop service
systemctl stop dynamic_sddm_bg.service
systemctl disable dynamic_sddm_bg.service

# Remove files
rm -rf /etc/profile.d/dynamic_sddm_bg.sh
rm -rf /usr/share/dynamic_sddm_bg
rm -rf /var/log/dynamic_sddm_bg
rm -rf /usr/share/sddm/themes/nasa_apod

echo -e "Dynamic SDDM Background removed!"
