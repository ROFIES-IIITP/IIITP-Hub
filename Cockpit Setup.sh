#!/bin/bash

# Update package lists
echo "Updating package lists..."
sudo nala update -y

# Install Cockpit
echo "Installing Cockpit..."
sudo nala install -y cockpit

# Enable and start Cockpit service
echo "Enabling and starting Cockpit..."
sudo systemctl enable --now cockpit.socket

# Confirm Cockpit status
echo "Checking Cockpit status..."
sudo systemctl status cockpit.socket --no-pager

# Display access URL
IP_ADDR=$(hostname -I | awk '{print $1}')
echo "Cockpit is set up! Access it via: http://$IP_ADDR:9090"

