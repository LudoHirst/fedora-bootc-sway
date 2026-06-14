#!/bin/bash
set -ouex pipefail

systemctl enable macbook-nvme-fix.service
systemctl enable greetd.service
systemctl set-default graphical.target
systemctl mask systemd-remount-fs.service

# remove softwares
dnf remove -y \
    kernel-devel kernel-headers make

dnf clean all
