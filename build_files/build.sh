#!/bin/bash

set -ouex pipefail

### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/39/x86_64/repoview/index.html&protocol=https&redirect=1

# this installs a package from fedora repos
dnf5 install -y tmux kmymoney micro python3-pip r fish fontawesome-fonts-all freetype-devel fribidi-devel zsh \
	 java-latest-openjdk-devel gcc gcc-c++ clang llvm sqlitebrowser lftp libcurl-devel libjpeg-turbo-devel libpng-devel libtiff-devel \
	 llvm-devel meson micro onedrive sqlitebrowser tcl8-devel tk8-devel typescript
  

# Use a COPR Example:

# Not sure what this is for, but was in original build.sh
dnf5 -y copr enable ublue-os/staging

# Install a rstudio from a COPR repository
dnf5 -y copr enable iucar/rstudio
dnf5 -y install rstudio-desktop
dnf5 -y copr disable iucar/rstudio

# Install cosmic desktop from a COPR repository
#dnf5 -y copr enable ryanabx/cosmic-epoch
#dnf5 -y install cosmic-desktop
#dnf5 -y copr disable ryanabx/cosmic-epoch

# Disable COPRs so they don't end up enabled on the final image:
# (again, not sure what this is for, but was in original build.sh)
dnf5 -y copr disable ublue-os/staging

#### Example for enabling a System Unit File

systemctl enable podman.socket
