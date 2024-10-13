#!/usr/bin/sh

NASA_API_KEY=$1

# Check API Key
if [ $NASA_API_KEY = "INSERT_YOUR_API_KEY_HERE" ]; then
	echo -e "ERROR:  API KEY WAS NOT ENTERED\n\tPlease edit config in the project's directory with your API key before continuing."
	exit 1
fi;

echo -e "NASA API KEY: ${NASA_API_KEY}"

page=$(curl -s $auth https://api.nasa.gov/planetary/apod?api_key=${NASA_API_KEY}&date=${DATE})

media_type=$(printf '%s' "$page" | jq -r '.media_type')

echo -e "\nPAGE:\n$page"
echo -e "\nMEDIA_TYPE:\n$media_type"



