#!/bin/bash

# Set keyboard layout
loadkeys us

# Unblock wireless wifi card
rfkill unblock wlan

# Connect to wifi
iwctl <<EOF
device wlan0 set-property Powered on
station wlan0 connect SSID
passphrase 25073CB30E
exit
EOF

# Set timezone
timedatectl set-timezone Europe/Brussels

# Partitions
sgdisk --zap-all /dev/sda
fdisk /dev/sda <<EOF
g
n


+1G
t
1
1
n


+4G
t
2
19
n



w
EOF
sleep 2
partprobe /dev/sda
mkfs.fat -F 32 /dev/sda1
mkswap /dev/sda2
mkfs.ext4 /dev/sda3
mount /dev/sda3 /mnt
mkdir -p /mnt/boot/efi
mount /dev/sda1 /mnt/boot/efi
swapon /dev/sda2

# Installation
pacstrap -K /mnt base linux linux-firmware grub efibootmgr networkmanager neovim 

genfstab -U /mnt >> /mnt/etc/fstab

arch-chroot /mnt
