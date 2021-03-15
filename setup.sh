#!/bin/bash

title="kizu's rice setup script"

copyConfigFiles() {
    clear
    echo "[*] Copying files..."
    cp -r ./cfg $HOME/.config

    sleep 1
    echo "[*] Copied files successfully."

    sleep 0.5
}

fuckUser() {
    clear
    echo "[*] User interrupted process. Exiting."
    exit
}

echo "[*] Starting setup script..."
sleep 0.5

welcome() {
    dialog --backtitle "$title" --title "$title" \
        --msgbox "This process will only copy my config files to $HOME/.config. Would you like to continue?" 10 70
}

success() {
    dialog --backtitle "$title" --title "$title" \
        --msgbox "Setup success. You can now close this window." 10 50
}

# Prompt user the welcome dialog
welcome || fuckUser

# Copy files from the repo to $HOME/.config
copyConfigFiles

# Show the success dialog when everything is fine
success && clear
