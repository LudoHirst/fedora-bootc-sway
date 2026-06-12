#!/bin/bash
set -ouex pipefail

systemctl enable first-boot-setup.service
systemctl enable macbook-nvme-fix.service
systemctl enable greetd.service
systemctl set-default graphical.target

# remove softwares
dnf remove -y \
    gcc kernel-devel kernel-headers make wget

dnf clean all
