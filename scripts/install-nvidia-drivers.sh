#!/bin/bash

# Update the package repository
sudo apt-get update

# Install necessary packages for NVIDIA driver installation
sudo apt-get install -y build-essential dkms

# Add the NVIDIA package repository
sudo add-apt-repository ppa:graphics-drivers/ppa -y

# Update the package repository again
sudo apt-get update

# Install the latest NVIDIA driver
sudo apt-get install -y nvidia-driver-$(ubuntu-drivers devices | grep recommended | awk '{print $3}')

# Reboot the system to apply changes
sudo reboot