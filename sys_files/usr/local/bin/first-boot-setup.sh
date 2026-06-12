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
while true; do
    USERNAME=""
    while [ -z "$USERNAME" ]; do
        read -p "Enter desired username: " USERNAME
    done

    # Create the user and add to the wheel (sudo) group
    if useradd -m -G wheel "$USERNAME"; then
        break
    else
        echo "Failed to create user '$USERNAME'. Please try another."
    fi
done

# Prompt for the password using the standard passwd utility
echo "Please set a password for $USERNAME:"
while ! passwd "$USERNAME"; do
    echo "Password setup failed. Please try again."
done

echo "User $USERNAME created successfully."

# Give the user a moment to read the success message before systemd 
# instantly kills the screen to start the display manager
sleep 3

# switch back to VT 1 for the display manager
chvt 1

