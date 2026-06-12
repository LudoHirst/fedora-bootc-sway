#!/bin/bash
set -ouex pipefail

git clone https://github.com/leifliddy/macbook12-bluetooth-driver.git /usr/src/macbook12-bluetooth-1.0
TARGET_KERNEL=$(ls -1 /usr/lib/modules | grep -E '^[0-9]' | sort -V | tail -n 1)
dkms add -m macbook12-bluetooth -v 1.0
dkms build -m macbook12-bluetooth -v 1.0 -k "${TARGET_KERNEL}"
dkms install -m macbook12-bluetooth -v 1.0 -k "${TARGET_KERNEL}"
