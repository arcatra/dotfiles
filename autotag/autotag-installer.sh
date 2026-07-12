# 1. Ensure the destination bin folder exists
mkdir -p ~/.local/bin

# 2. Download the explicit release asset
wget -q --show-progress https://github.com/jamerst/AutoTag/releases/download/v4.1.0/autotag-v4.1.0_linux-x64.zip

# 3. Unzip it (adding -o to overwrite automatically so it doesn't prompt you)
unzip -qo autotag-v4.1.0_linux-x64.zip -d ~/.local/bin/autotag_dir

# 4. Give execution permissions explicitly to the lowercase binary
chmod +x ~/.local/bin/autotag_dir/autotag

# 5. Force-create the symlink to run it globally
ln -sf ~/.local/bin/autotag_dir/autotag ~/.local/bin/autotag

# 6. Clean up the source zip file
rm autotag-v4.1.0_linux-x64.zip
