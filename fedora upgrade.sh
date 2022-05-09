sudo dnf upgrade --refresh
sudo dnf install dnf-plugin-system-upgrade -y
sudo dnf system-upgrade download --releasever=36
dnf list available gstreamer1\*plugin\*
sudo dnf --disable unitedrpms
sudo dnf config-manager --disable unitedrpms
sudo dnf system-upgrade download --releasever=36
sudo dnf upgrade --refresh
sudo dnf remove obs-studio  live555 gstreamer1-plugins-bad-free -y
sudo dnf remove gstreamer1-plugins-bad-free-gtk
sudo dnf remove ffmpeg4-libs
sudo dnf remove libmysofa-libs
sudo dnf system-upgrade download --refresh --allowerasing --releasever=36 -y

sudo fixfiles -B onboot
# следующая команда  вызовет мгновенную перезагрузку с последующим обновлением системы
sudo dnf system-upgrade reboot

sudo dnf system-upgrade clean
sudo symlinks -r -d /usr

sudo hostnamectl set-hostname --static fedora-ar
