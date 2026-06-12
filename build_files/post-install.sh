#!/bin/bash
set -ouex pipefail

systemctl enable first-boot-setup.service
systemctl enable macbook-nvme-fix.service
systemctl enable greetd.service

# remove softwares
dnf remove -y \
    gcc kernel-devel kernel-headers make wget

dnf clean all
