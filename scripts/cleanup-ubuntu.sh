#!/bin/bash

echo "--- APT clean ---"
# clears out the local repository of retrieved package files
# It removes everything but the lock file from /var/cache/apt/archives/ and /var/cache/apt/archives/partial
apt-get clean

# journalctl
if command -v journalctl; then
    journalctl --rotate
    journalctl --vacuum-time=1s
fi

echo "--- Remove apt mock ---"
prefix=/usr/local/bin
for tool in apt apt-get apt-key;do
    rm -f $prefix/$tool
done
