#!/bin/bash

echo "--- Installing Python ---"
apt install -y python3.12 python3.12-venv

echo "--- Creating Python virtual environment ---"

echo "--- Creating venv ---"
python3.12 -m venv /opt/venv

### Create a profile file to activate the venv
echo "--- Activating venv ---"

### /etc/profile.d/
# PROFILE_FILE="/etc/profile.d/python_venv_path.sh"
# echo "#!/bin/bash" > "$PROFILE_FILE"
# echo "export PATH=/opt/venv/bin:\$PATH" >> "$PROFILE_FILE"
# chmod +x "$PROFILE_FILE"

### ~/.bashrc
echo "export PATH=/opt/venv/bin:\$PATH" >> ~/.bashrc

echo "--- End Installing Python ---"
