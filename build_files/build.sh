#!/bin/bash

set -ouex pipefail

### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/39/x86_64/repoview/index.html&protocol=https&redirect=1

# this installs a package from fedora repos
dnf5 install -y tmux kmymoney micro python3-pip r fish fontawesome-fonts-all freetype-devel fribidi-devel zsh java-latest-openjdk-devel gcc gcc-c++ clang llvm
dnf5 install -y lftp libcurl-devel libjpeg-turbo-devel libpng-devel libtiff-devel llvm-devel meson micro onedrive python3-colorama python3-ipykernel python3-pip python3-pyquery sqlitebrowser tcl8-devel tk8-devel typescript 

# Use a COPR Example:
#
# dnf5 -y copr enable ublue-os/staging
dnf5 -y copr enable elkhan/PyCharm
dnf5 -y install pycharm-community
dnf5 -y  copr disable elkhan/Pycharm

dnf5 -y copr enable iucar/rstudio
dnf5 -y install rstudio-desktop
dnf5 -y copr disable iucar/rstudio

# dnf5 -y install package
# Disable COPRs so they don't end up enabled on the final image:
# dnf5 -y copr disable ublue-os/staging

#### Example for enabling a System Unit File

systemctl enable podman.socket
