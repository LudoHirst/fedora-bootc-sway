#!/bin/bash
set -ouex pipefail

# install base
dnf install -y --skip-unavailable \
    NetworkManager NetworkManager-bluetooth NetworkManager-config-connectivity-fedora NetworkManager-wifi \
    NetworkManager-wwan acl alsa-ucm alsa-utils at-spi2-atk at-spi2-core \
    attr audit bash bash-color-prompt bash-completion bc bind-utils bluez-cups \
    brcmfmac-firmware btrfs-progs bzip2 chrony cifs-utils colord compsize coreutils cpio cryptsetup \
    cups cups-browsed cups-filters curl cyrus-sasl-plain default-editor  default-fonts-cjk-serif \
    default-fonts-core-emoji default-fonts-core-math default-fonts-core-mono default-fonts-core-sans \
    default-fonts-core-serif default-fonts-other-mono default-fonts-other-sans default-fonts-other-serif \
    dnsmasq e2fsprogs ethtool exfatprogs file filesystem firewalld fpaste fwupd gamemode glibc \
    glibc-all-langpacks gnupg2 gstreamer1-plugin-dav1d gstreamer1-plugin-libav gstreamer1-plugins-bad-free \
    gstreamer1-plugins-good gstreamer1-plugins-ugly-free gutenprint gutenprint-cups hostname hplip hunspell \
    intel-gpu-firmware iproute iptables-nft iptstate iputils kbd kmscon less libglvnd-gles \
    linux-firmware logrotate lrzsz lsof man-db man-pages mdadm mesa-dri-drivers mesa-vulkan-drivers mpage \
    mtr nfs-utils nss-altfiles nss-mdns ntfs-3g ntfsprogs opensc openssh-clients \
    openssh-server pam_afs_session paps passwdqc pciutils pinfo pipewire-alsa pipewire-config-raop \
    pipewire-gstreamer pipewire-pulseaudio pipewire-utils policycoreutils \
    policycoreutils-python-utils prefixdevname procps-ng psmisc qemu-guest-agent quota realmd rootfiles rpm \
    rpm-ostree rsync samba-client selinux-policy-targeted setup shadow-utils sos spice-vdagent spice-webdavd \
    sssd-common sssd-kcm sudo system-config-printer-udev systemd systemd-oomd-defaults systemd-resolved \
    systemd-udev tar time tree unzip uresourced usb_modeswitch usbutils util-linux vim-minimal wget2-wget \
    which whois wireplumber words wpa_supplicant zip zram-generator-defaults

# add rpmfusion
dnf install -y \
    https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
    https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

dnf install -y --nogpgcheck --repofrompath \
    'terra,https://repos.fyralabs.com/terra$releasever' terra-release

# install extra
dnf swap -y --allowerasing ffmpeg-free ffmpeg
dnf install -y --skip-unavailable \
    gcc kernel-devel kernel-headers make wget git \
    intel-media-driver openh264 intel-gpu-tools just vim-enhanced flatpak-spawn fzf lshw htop \
    blueman bolt fprintd-pam gnome-keyring-pam grim gvfs gvfs-smb imv kanshi \
    mesa-dri-drivers mesa-vulkan-drivers network-manager-applet pavucontrol pinentry-gnome3 playerctl \
    polkit lxqt-policykit pulseaudio-utils slurp xorg-x11-server-Xwayland \
    sway swaybg swayidle swaylock greetd tuigreet sfwbar mako \
    system-config-printer tuned-ppd tuned-switcher \
    wev wl-clipboard wlr-randr wlsunset xdg-desktop-portal-gtk xdg-desktop-portal-wlr \
    chromium ghostty emacs-pgtk aria2 mpv yt-dlp fastfetch \
    google-noto-sans-balinese-fonts google-noto-sans-cjk-fonts \
    google-noto-sans-javanese-fonts google-noto-sans-sundanese-fonts google-go-mono-fonts \
    google-tinos-fonts google-arimo-fonts google-carlito-fonts google-cousine-fonts \
    google-crosextra-caladea-fonts
