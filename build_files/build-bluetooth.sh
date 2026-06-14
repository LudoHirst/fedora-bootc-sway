#!/bin/bash
set -ouex pipefail

git clone https://github.com/leifliddy/macbook12-bluetooth-driver.git /tmp/macbook12-bluetooth-driver
pushd /tmp/macbook12-bluetooth-driver

TARGET_KERNEL=$(ls -1 /usr/lib/modules | grep -E '^[0-9]' | sort -V | tail -n 1)

# The installer script hardcodes `uname -r`, which returns the host kernel version
# instead of the container's target kernel version. We patch it to use TARGET_KERNEL.
sed -i "s/\$(uname -r)/${TARGET_KERNEL}/g" install.bluetooth.sh
sed -i "s/\`uname -r\`/${TARGET_KERNEL}/g" install.bluetooth.sh
sed -i "s/\$(shell uname -r)/${TARGET_KERNEL}/g" Makefile
sed -i "s/depmod -a/depmod -a ${TARGET_KERNEL}/g" Makefile

# Run the build and install process
bash install.bluetooth.sh -k "${TARGET_KERNEL}"

# Cleanup driver source
popd
rm -rf /tmp/macbook12-bluetooth-driver
