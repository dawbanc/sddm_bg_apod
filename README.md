# Astronomy Picture of the Day for SDDM Background

I was tired of my desktop background and SDDM background not matching. While this script can't always solve this, it can change the pictures so at least it isn't static. This script will download the NASA Astronomy Picture of the Day after you login for the first time that day. 

![Screenshot of what the SDDM theme looks like.](/theme/preview.png)

# Requirements

### NASA API Key
You will need to aquire your own NASA API key. Don't worry, they are free. 

Head to NASA's [website for API keys](https://api.nasa.gov/). Then fill in your information and hit sign up. You should receive your API key via email address. If not, you may need to contact NASA.

### System Requirements
I am running this with KDE Plasma 6 on Fedora. Other systems may be unsupported, but I will do my best to help debug issues!

You will need `git` to download.

# How to Install and Uninstall

> Sidenote for people who are newer to linux:
> You should never install things from the internet on your machine without looking through the files. The Makefile calls script/install.sh and script/uninstall.sh and copies theme on to your system. Please review these before installing.

### To download:
Run:
```
git clone https://github.com/dawbanc/sddm_bg_apod.git
```

### To install:
Copy the NASA API key (if you don't have one, go read the Requirements section) into the config file replacing `INSERT_YOUR_API_KEY_HERE`.

Then run:
```
sudo make install
```
While running that command, you will need to open your system settings and navigate to `Colors & Themes` then `Login Screen (SDDM)`. Once there, choose the `"NASA: Astronomy Picture of the Day"` theme and apply. You may be prompted for superuser credentials.

### To uninstall:
Run: 
```
sudo make uninstall
```
While running that command, you will need to open your system settings and navigate to `Colors & Themes` then `Login Screen (SDDM)`. Once there, choose a theme that is __NOT__ the `"NASA: Astronomy Picture of the Day"` theme and apply. You may be prompted for superuser credentials.

# Debugging

### Redownloading a daily picture
If you were not connected to the internet after logging in for the first time that day (or noticed that the script didn't update the picture, you can reset the script by running:
```
sudo make reset_script
```
Then open a new terminal and the picture should download.

### Viewing the logfile
You may be able to get more relevant information by viewing /var/log/dynamic_sddm_bg/dsb.log

### Other issues
Please file an issue on the Github's [issue page](https://github.com/dawbanc/sddm_bg_apod/issues).
Please include a copy (NOT A SCREENSHOT) of your dsb.log as well as the output of `kinfo` and your `sddm` version.
For SDDM version, you may have to use your distro's package manager to get version; ie for Fedora: `dnf info sddm`


# Special notes
The theme is based off of the Breeze theme for SDDM. However, if you have another theme you like more that you would like with the changing backgrounds, it is entirely possible to edit that theme and change it's background to the NASA: APOD. I suggest making a copy of that theme, then editing the `theme.conf`, you can change the name and the background. If you point the background property to `/etc/dynamic_sddm_bg/nasa_apod.jpg` with the script installed, you will have your own custom theme with the NASA Astronomy Picture of the Day as the background.
