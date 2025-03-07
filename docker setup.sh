#!/bin/bash

# Update package lists
echo "Updating package lists..."
sudo nala update -y

# Install Docker
echo "Installing Docker..."
sudo nala install -y docker.io

# Enable and start Docker service
echo "Enabling and starting Docker..."
sudo systemctl enable --now docker

# Verify Docker installation
echo "Verifying Docker installation..."
docker --version && echo "Docker installed successfully!"

# Reboot notice for group changes to take effect
echo "Please reboot or re-login for the Docker group changes to apply."
