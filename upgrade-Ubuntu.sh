## upgrade from Ubuntu 21.10 to Ubuntu 22.04

sudo apt update && sudo apt dist-upgrade

# Then make sure you have the update-manager-core package installed.

sudo apt install update-manager-core

# After that, run the following command to begin the upgrade process.

do-release-upgrade -d
