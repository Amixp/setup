dnf install inxi wget nano htop neofetch -y
rpm --import https://download.sublimetext.com/sublimehq-rpm-pub.gpg
rpm --import https://d2t3ff60b2tol4.cloudfront.net/repomd.xml.key
dnf config-manager --add-repo https://download.sublimetext.com/rpm/stable/x86_64/sublime-text.repo
dnf install sublime-text sublime-merge vim-enhanced -y
dnf install python3 python3-virtualenv python3-pip -y

tee /etc/yum.repos.d/insync.repo << "EOF"
[insync]
name=insync repo
baseurl=http://yum.insync.io/fedora/35/
gpgcheck=1
gpgkey=https://d2t3ff60b2tol4.cloudfront.net/repomd.xml.key
enabled=1
metadata_expire=120m
EOF

dnf install insync -y
dnf install remmina -y

tee /etc/yum.repos.d/vscode.repo << "EOF"
[vscode]
name=Visual Studio Code
baseurl=https://packages.microsoft.com/yumrepos/vscode
enabled=1
gpgcheck=1
gpgkey=https://packages.microsoft.com/keys/microsoft.asc
EOF

rpm --import https://packages.microsoft.com/keys/microsoft.asc
dnf install code -y

dnf install dnf-plugins-core curl-devel expat-devel gettext-devel gcc openssl-devel zlib-devel perl-ExtUtils-MakeMaker -y
dnf install git-all -y

dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm -y
dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y
dnf install telegram -y

flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

flatpak install -y fondo
flatpak install -y kdenlive
flatpak install -y bitwarden

dnf install qbittorrent -y

curl -o /etc/yum.repos.d/skype-stable.repo https://repo.skype.com/rpm/stable/skype-stable.repo

dnf install skypeforlinux -y

rpm --import https://raw.githubusercontent.com/UnitedRPMs/unitedrpms/master/URPMS-GPG-PUBLICKEY-Fedora
dnf -y install https://github.com/UnitedRPMs/unitedrpms/releases/download/19/unitedrpms-$(rpm -E %fedora)-19.fc$(rpm -E %fedora).noarch.rpm

dnf install gnome-tweaks -y
dnf install gnome-extensions-app -y

#https://extensions.gnome.org/extension/19/user-themes/


dnf --releasever=32 install -y pangox-compat.x86_64
#если ошибка: Error: Не удалось загрузить метаданные для репозитория «anydesk»: repomd.xml GPG signature verification error: Bad GPG signature
#rm -r /var/cache/dnf
rpm --import https://keys.anydesk.com/repos/RPM-GPG-KEY
tee /etc/yum.repos.d/AnyDesk.repo << "EOF"
[anydesk]
name=AnyDesk Fedora - stable
baseurl=http://rpm.anydesk.com/fedora/$basearch/
gpgcheck=1
repo_gpgcheck=1
gpgkey=https://keys.anydesk.com/repos/RPM-GPG-KEY
EOF

dnf install -y anydesk

anydesk-global-settings

wget https://download.teamviewer.com/download/linux/teamviewer.x86_64.rpm
dnf install ./teamviewer.x86_64.rpm -y

#rpm -e --nodeps zfs-fuse
#dnf install -y https://zfsonlinux.org/fedora/zfs-release$(rpm -E %dist).noarch.rpm
#dnf install -y kernel-devel
#dnf install -y zfs
#modprobe zfs
#echo zfs > /etc/modules-load.d/zfs.conf

dnf install -y kernel-devel-$(uname -r) kernel-headers
cd /home/artem/Загрузки/

wget https://www.vmware.com/go/getworkstation-linux
chmod 700 VMware-Workstation-Full-*.bundle
./VMware-Workstation-Full-*.bundle

sudo dnf install -y openssl
#sudo mkdir -p /misc/sign-vmware-modules
#sudo chmod 777 /misc/sign-vmware-modules
#cd /misc/sign-vmware-modules
#openssl req -new -x509 -newkey rsa:2048 -keyout MOK.priv -outform DER -out MOK.der -nodes -days 36500 -subj "/CN=MSI/"
#chmod 600 MOK.priv
#sudo mokutil --import MOK.der

tee /misc/sign-vmware-modules/signingscript << "EOF"
#!/bin/bash

for modfile in $(modinfo -n vmmon vmnet); do
  echo "Signing $modfile"
  /usr/src/kernels/$(uname -r)/scripts/sign-file sha256 \
                      /misc/sign-vmware-modules/MOK.priv \
                      /misc/sign-vmware-modules/MOK.der "$modfile"
done
EOF

chmod 700 /misc/sign-vmware-modules/signingscript
chmod +x /misc/sign-vmware-modules/signingscript
sudo /misc/sign-vmware-modules/signingscript


dnf install steam -y
dnf install pycharm-community thunderbird -y

dnf config-manager --set-enabled google-chrome
dnf install google-chrome-stable -y

wget https://cache-ams06.cdn.yandex.net/download.cdn.yandex.net/browser/yandex/ru/beta/Yandex.rpm
dnf install Yandex.rpm -y

dnf install qt5-designer python3-tkinter -y
echo "[daemon]
WaylandEnable=false
DefaultSession=gnome-xorg.desktop"

vim /etc/gdm/custom.conf

echo "fastestmirror=True
max_parallel_downloads=10
defaultyes=True"

vim /etc/dnf/dnf.conf

flatpak install -y app/md.obsidian.Obsidian

curl -1sLf 'https://dl.cloudsmith.io/public/asbru-cm/release/cfg/setup/bash.rpm.sh' | sudo -E bash
curl -1sLf 'https://dl.cloudsmith.io/public/asbru-cm/loki/cfg/setup/bash.rpm.sh' | sudo -E bash
dnf install asbru-cm nutty -y

dnf install timeshift snapper -y

dnf install gnome-todo adcli aisleriot baobab cheese deja-dup gnome-calendar gnome-mahjongg gnome-mines gnome-sudoku libreoffice-impress libreoffice-math libreoffice-ogltrans libreoffice-pdfimport libreoffice-writer realmd remmina rhythmbox shotwell simple-scan sssd sssd-tools thunderbird totem vagrant java-latest-openjdk libreoffice-calc gnome-tweaks -y

dnf install flameshot screenfetch playonlinux spotify-client -y

dnf install dnf-automatic -y
systemctl enable --now dnf-automatic.timer
systemctl enable --now dnf-automatic-install.timer

dnf install -y dnf-plugins-core
dnf config-manager --add-repo https://rpm.releases.hashicorp.com/fedora/hashicorp.repo
dnf install VirtualBox virtualbox-guest-additions libvirt-daemon-driver-vbox libvirt-daemon-vbox vagrant vagrant-libvirt -y
dnf install -y qemu libvirt libvirt-devel ruby-devel gcc qemu-kvm
CONFIGURE_ARGS="with-libvirt-include=/usr/include/libvirt with-libvirt-lib=/usr/lib64" vagrant plugin install vagrant-libvirt

#mv ~/.ssh ~/.ssh.old.1
#ln -s ~/Insync/admin@betark.ru/OneDrive/.ssh ~/
#chmod 600 ~/.ssh/*
#ln -s /home/artem/projects/ssh_config /home/artem/.ssh/config.d
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install flathub com.syntevo.SmartGit -y

#https://copr.fedorainfracloud.org/coprs/surfernsk/Personal_repos/
dnf copr enable surfernsk/Personal_repos -y
dnf install yandex-disk-indicator -y

dnf -y install https://extras.getpagespeed.com/release-latest.rpm
dnf -y yum-utils
yum-config-manager --enable getpagespeed-extras-varnish60

# Install Extension Manager
#https://beta.flathub.org/ru/apps/details/com.mattjakeman.ExtensionManager
 
dnf install -y lsb-core-noarch
#https://cryptopro.ru/products/csp/downloads#latest_csp50r2_linux
wget https://cryptopro.ru/sites/default/files/private/csp/50/12000/linux-amd64.tgz
tar -xf linux-amd64.tgz -C /tmp
sudo /tmp/linux-amd64/install.sh cprocsp-rdr-gui-gtk
#https://www.cryptopro.ru/download?pid=302
wget https://www.cryptopro.ru/sites/default/files/products/cades/current_release_2_0/cades-linux-amd64.tar.gz

sudo tar -xf cades-linux-amd64.tar.gz -C /tmp
sudo rpm -i /tmp/cprocsp-pki-cades-64-2.0.14530-1.amd64.rpm 

wget -qO - http://packages.lab50.net/okular/install | sudo /bin/sh




