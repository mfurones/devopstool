echo "--- APT clean ---"
# clears out the local repository of retrieved package files
# It removes everything but the lock file from /var/cache/apt/archives/ and /var/cache/apt/archives/partial
apt-get clean

# journalctl
if command -v journalctl; then
    journalctl --rotate
    journalctl --vacuum-time=1s
fi

echo "--- Log clean ---"
# delete all .gz and rotated file
find /var/log -type f -regex ".*\.gz$" -delete
find /var/log -type f -regex ".*\.[0-9]$" -delete
# wipe log files
find /var/log/ -type f -exec cp /dev/null {} \;

echo "--- symlinks clean ---"
rm -f /usr/local/bin/invoke_tests

