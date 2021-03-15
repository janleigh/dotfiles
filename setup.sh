#!/bin/bash
# Messy code! You have been warned.

title="kizu's rice setup script"
packages="i3-gaps rofi polybar neovim-nightly-bin picom brightnessctl playerctl dunst hsetroot"

downloadDependencies() {
    if grep "Manjaro\|Arch\|EndeavourOS\|Artix" /etc/*-release; then
        clear 
        echo "[*] Downloading dependencies..."
        # yay -S "$packages"

        echo "[*] Downloaded dependencies."

        sleep 0.5
    else
        clear
        echo "[*] Not on Arch based system. Failed to download dependencies."

        sleep 0.5
    fi
}

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
        --msgbox "This process will download the need dependencies and copy the config files to $HOME/.config. Would you like to continue?" 10 70
}

success() {
    dialog --backtitle "$title" --title "$title" \
        --msgbox "Setup success. You can now close this window." 10 50
}

# Prompt user the welcome dialog
welcome || fuckUser

# Download dependencies
# downloadDependencies

# Copy files from the repo to $HOME/.config
copyConfigFiles

# Show the success dialog when everything is fine
success && clear
