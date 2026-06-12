#!/bin/sh
# Clear the screen for a clean prompt
clear

echo "======================================"
echo " Welcome to your new system!"
echo " Let's create your primary user account."
echo "======================================"

read -p "Enter desired username: " USERNAME

# Create the user and add to the wheel (sudo) group
useradd -m -G wheel "$USERNAME"

# Prompt for the password using the standard passwd utility
echo "Please set a password for $USERNAME:"
passwd "$USERNAME"

echo "User $USERNAME created successfully."
sleep 2
