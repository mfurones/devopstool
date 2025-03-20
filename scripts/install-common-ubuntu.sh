#!/bin/bash

echo "--- Installing apt packages ---"

echo "--- Installing curl ---"
### https://curl.se/docs/install.html
### https://askubuntu.com/questions/259681/the-program-curl-is-currently-not-installed
apt-get install -y curl

echo "--- Installing wget ---"
### https://www.tecmint.com/install-wget-in-linux/
apt-get install -y wget

echo "--- Installing unzip ---"
### https://askubuntu.com/questions/86849/how-to-unzip-a-zip-file-from-the-terminal
apt-get install -y unzip

echo "--- End Installing apt packages ---"
