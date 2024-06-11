#!/usr/bin/sh

logfile="/var/log/dynamic_sddm_bg/dsb.log"
picture_location="/usr/share/dynamic_sddm_bg/nasa_apod.jpg"

current_date=$(date +%Y-%m-%d)
last_modified=$(date --date=@$(stat -c %Y /var/log/dynamic_sddm_bg/dsb.log) +%Y-%m-%d)
log_date=$(date +%Y%m%d_%H%M)

nasa_api_key="NASA_API_KEY_PLACEHOLDER"
nasa_api_url="https://api.nasa.gov/planetary/apod?api_key=$nasa_api_key&date=$current_date"

net_max=10
for (( i=$net_max; i >=0; i-- )) do
	if [ "$(hostname -I)" != "" ]; then
		break
	fi
	echo -e "$log_date : Waiting for network $i more time(s)..." >> "$logfile"
	sleep 5
done

if [ ! -f $logfile ]; then
	touch -t 6512120000 $logfile
	echo "$log_date : Logfile does not exist. Creating a 1965 file" >> "$logfile"
fi

if [ ! -f $picture_location ]; then
	echo "$log_date : Picture does not exist. Creating a temporary empty photo" >> "$logfile"
	touch $picture_location
fi	

if [ "$last_modified" = "$current_date" ]; then
	echo "$log_date : Photo already copied today" >> "$logfile"
	echo "$log_date : " >> "$logfile"
else
	## DOWNLOAD AND COPY THE FILE
	echo "$log_date : Downloading NASA picture of the day" >> "$logfile"
	# get page
	page=$(curl -s $auth $nasa_api_url)
	# get media type
	media_type=$(printf '%s' "$page" | jq -r '.media_type')
	echo -e "$log_date : Media type: $media_type" >> "$logfile"
	if [ $media_type = "image" ]; then
	
		media_url=$(printf '%s' "$page" | jq -r '.url')
		
		echo "$log_date : Copying NASA Picture of the Day to the daily location" >> "$logfile"
		curl -s $media_url > $picture_location

		echo "$log_date : Done!" >> "$logfile"
		echo "$log_date : " >> "$logfile"

	else
		
		echo "$log_date : ERROR: Nasa Picture of the Day is not an image type...will try again tomorrow" >> "$logfile"
		echo "$log_date : " >> "$logfile"

	fi
fi
