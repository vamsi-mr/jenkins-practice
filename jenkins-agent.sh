#!/bin/bash

# Expand partition
growpart /dev/nvme0n1 4

pvresize /dev/nvme0n1p4

# Extend LVs (auto-resize filesystems with -r)
lvextend -L +10G /dev/mapper/RootVG-homeVol
lvextend -L +10G /dev/mapper/RootVG-varVol
lvextend -l +100%FREE /dev/mapper/RootVG-varTmpVol

xfs_growfs /home
xfs_growfs /var
xfs_growfs /var/tmp

# Install Java
yum install fontconfig java-17-openjdk -y
