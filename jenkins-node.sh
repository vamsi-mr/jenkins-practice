#!/bin/bash

# Expand partition
growpart /dev/nvme0n1 4

pvresize /dev/nvme0n1p4

# Extend LVs (auto-resize filesystems with -r)
lvextend -L +10G /dev/RootVG/rootVol
lvextend -L +10G /dev/mapper/RootVG-varVol
lvextend -l +100%FREE /dev/mapper/RootVG-varTmpVol

xfs_growfs /
xfs_growfs /var
xfs_growfs /var/tmp

# Install Jenkins
curl -o /etc/yum.repos.d/jenkins.repo \
    https://pkg.jenkins.io/redhat-stable/jenkins.repo
rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
yum install -y fontconfig java-17-openjdk jenkins
systemctl daemon-reload
systemctl start jenkins
systemctl enable jenkins
