param()

Write-Host "--- Installing apt packages ---"

Write-Host "--- Installing curl ---"
### https://curl.se/docs/install.html
### https://askubuntu.com/questions/259681/the-program-curl-is-currently-not-installed
apt-get install -y curl

Write-Host "--- Installing wget ---"
### https://www.tecmint.com/install-wget-in-linux/
apt-get install -y wget

Write-Host "--- Installing unzip ---"
### https://askubuntu.com/questions/86849/how-to-unzip-a-zip-file-from-the-terminal
apt-get install -y unzip

Write-Host "--- Installing tree ---"
apt-get install -y tree

Write-Host "--- Installing rsync ---"
apt-get install -y rsync

Write-Host "--- Installing gnupg ---"
apt-get install -y gnupg

Write-Host "--- Installing VIM ---"
apt-get install -y vim

Write-Host "--- Installing JQ ---"
apt-get install -y jq

Write-Host "--- Installing ca-certificates ---"
apt-get install -y ca-certificates

Write-Host "--- End Installing apt packages ---"
