#!/usr/bin/bash

# If using plus, put creds here
USER=your_username
PASSWORD=your_password

# grab the rss feed write it to mysterious.xml, if not using "plus" feed authentication may be ommited
wget --user $USER --password $PASSWORD -O mysterious.xml https://mysteriousuniverse.org/feed/muplushq/

# grep out the lines with links to MP3s, append it to 'mysterious.txt'
grep -e '[^"]*\.mp3' mysterious.xml | grep -o '[^"]*\.mp3' '-' >> mysterious.txt

# get only MP3s that do not already exist
wget -N -i mysterious.txt
