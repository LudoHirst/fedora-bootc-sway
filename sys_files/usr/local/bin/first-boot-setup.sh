#!/bin/bash

# 1. Force the monitor to actually look at TTY2
chvt 2
# Give the system a brief moment to execute the switch
sleep 1 

clear

echo "======================================"
echo " Welcome to your new system!"
echo " Let's create your primary user account."
echo "======================================"

# 2. Prevent accidental empty inputs from crashing the setup
USERNAME=""
while [ -z "$USERNAME" ]; do
    read -p "Enter desired username: " USERNAME
done

# Create the user and add to the wheel (sudo) group
useradd -m -G wheel "$USERNAME"

# Prompt for the password using the standard passwd utility
echo "Please set a password for $USERNAME:"
passwd "$USERNAME"

echo "User $USERNAME created successfully."

# Give the user a moment to read the success message before systemd 
# instantly kills the screen to start the display manager
sleep 3
