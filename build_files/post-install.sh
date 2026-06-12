#!/bin/bash
set -ouex pipefail

systemctl enable first-boot-setup.service
systemctl enable macbook-nvme-fix.service

# remove softwares
dnf remove -y \
    dkms gcc kernel-devel kernel-headers make wget

dnf clean all
