#!/bin/bash

# Update and Upgrade the System
echo "Updating system..."
sudo apt update -y

# Install Nala if not installed
if ! command -v nala &>/dev/null; then
    echo "Installing Nala..."
    sudo apt install -y nala
fi

# Upgrade the system using Nala
echo "Upgrading system..."
sudo nala upgrade -y

# Install Required Packages
echo "Installing required packages..."
sudo nala install -y btop openssh-server

# Enable and Start SSH Service
echo "Enabling and starting SSH service..."
sudo systemctl enable --now ssh

# Confirm SSH Status
if systemctl is-active --quiet ssh; then
    echo "SSH is running ✅"
else
    echo "SSH failed to start ❌"
fi

# Reboot Prompt with Countdown
echo -e "\nSystem will reboot shortly..."
echo "Press Ctrl + C to cancel."

for i in {3..1}; do
    echo "$i..."
    sleep 1
done

echo "Rebooting now!"
sudo reboot
