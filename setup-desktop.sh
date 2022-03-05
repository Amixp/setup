
apt update
inst="apt install -y"

${inst} stacer net-tools nano vim  vim-addon-manager vim-haproxy vim-icinga2  vim-puppet vim-gtk3 vim-scripts vim-syntastic vim-tabular 
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | apt-key add -
echo "deb https://download.sublimetext.com/ apt/stable/" | tee /etc/apt/sources.list.d/sublime-text.list
apt update
${inst} sublime-text software-properties-common apt-transport-https wget curl sublime-merge 
# wget https://download.sublimetext.com/sublime-merge_build-2049_amd64.deb
# dpkg -i  sublime-merge_build-2049_amd64.deb

curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'

#echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list
# add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
call ~/Insync/admin@betark.ru/OneDrive/projects/check_keys.sh
apt update
apt --fix-broken -y install
${inst} code 
${inst} gvfs 
echo "fs.inotify.max_user_watches=524288" >> /etc/sysctl.conf
apt remove docker docker-engine docker.io containerd runc  -y
${inst} apt-transport-https ca-certificates  gnupg lsb-release 
curl -fsSL https://download.docker.com/linux/ubuntu/gpg |  gpg --dearmor --batch --yes -o /usr/share/keyrings/docker-archive-keyring.gpg
echo \
  "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -sc) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null
apt-get update
${inst} docker-ce docker-ce-cli containerd.io 
systemctl enable docker
systemctl start docker
docker run hello-world
${inst} libz-dev libssl-dev libcurl4-gnutls-dev libexpat1-dev gettext cmake gcc 
${inst} git meld python3-pip 
${inst} steam vlc 

echo "deb [arch=amd64] https://repo.skype.com/deb stable main" | tee /etc/apt/sources.list.d/skype-stable.list
curl https://repo.skype.com/data/SKYPE-GPG-KEY | sudo apt-key add - 
apt update
${inst} skypeforlinux 
${inst} telegram-desktop 
git config --global user.name "Artem Hudoley"
git config --global user.email "a.khudoley@rtk-dc.ru"
apt update
apt upgrade -y

${inst} nmap timeshift gparted snapper parted btrfs-progs apt-btrfs-snapshot btrbk btrfs-compsize btrfs-heatmap diffoscope neofetch w3m-img

 
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys ACCAF35C
#sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys ACCAF35C
echo "deb http://apt.insync.io/ubuntu $(lsb_release -sc)  non-free contrib" |  tee /etc/apt/sources.list.d/insync.list > /dev/null
apt update -y
${inst} insync 

wget -qO - https://keys.anydesk.com/repos/DEB-GPG-KEY | apt-key add -
echo "deb http://deb.anydesk.com/ all main" | tee /etc/apt/sources.list.d/anydesk-stable.list
apt update -y
${inst} anydesk 

wget -nc https://download.teamviewer.com/download/linux/teamviewer_amd64.deb
dpkg -i teamviewer_amd64.deb
apt-get -f install -y
dpkg -i teamviewer_amd64.deb

#curl -s https://packagecloud.io/install/repositories/asbru-cm/asbru-cm/script.deb.sh | bash

curl -1sLf "https://dl.cloudsmith.io/public/asbru-cm/release/gpg.7684B0670B1C65E8.key" | apt-key add -
echo \
"deb https://packagecloud.io/asbru-cm/asbru-cm/ubuntu/ focal  main \n
deb-src https://packagecloud.io/asbru-cm/asbru-cm/ubuntu/ focal main" |  tee /etc/apt/sources.list.d/asbru-cm_asbru-cm.list > /dev/null
apt update
${inst} asbru-cm 

${inst} ansible ansible-mitogen ansible-lint sshpass

echo "deb [arch=amd64] https://download.virtualbox.org/virtualbox/debian $(lsb_release -sc)  contrib" |  tee /etc/apt/sources.list.d/virtualbox.list > /dev/null
wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | apt-key add -
wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | apt-key add -
apt update
${inst} virtualbox-6.1 
wget -nc https://github.com/arsenetar/dupeguru/releases/download/4.1.1/dupeguru_4.1.1_amd64.deb
dpkg -i dupeguru_4.1.1_amd64.deb
 
${inst} dupeguru 
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys D1742AD60D811D58
add-apt-repository -y "deb http://repository.spotify.com stable non-free"
${inst} spotify-client 
${inst} mint-meta-codecs 

${inst} playonlinux wine 
${inst} flameshot screenfetch fortune fortunes-ru
#${inst} zsh
#sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# nano ~/.zshrc
#plugins=(git npm vagrant composer sudo web-search ansible dash nmap jira)
#https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/
#cd to/my/project
#echo "https://jira.atlassian.com" >> .jira-url
#
    # $JIRA_URL - Your JIRA instance's URL
    # $JIRA_NAME - Your JIRA username; used as the default user for assigned/reported searches
    # $JIRA_PREFIX - Prefix added to issue ID arguments
    # $JIRA_RAPID_BOARD - Set to true if you use Rapid Board
    # $JIRA_DEFAULT_ACTION - Action to do when jira is called with no arguments; defaults to "new"

#ZSH_THEME="agnoster".
#Не забываем про source ~/.zshrc

#Давайте установим пропатченные шрифты
${inst} fonts-powerline
#======================================

#mv ~/.config/asbru ~/.config/asbru.old
#ln -s ~/Insync/admin@betark.ru/OneDrive/asbru ~/.config 

${inst} gnome-shell-extension-system-monitor indicator-multiload

wget -O - https://dl.winehq.org/wine-builds/winehq.key | apt-key add -
apt-add-repository -y "deb https://dl.winehq.org/wine-builds/ubuntu/ $(lsb_release -sc) main"
${inst} --install-recommends winehq-staging

${inst} adcli aisleriot baobab branding-ubuntu cheese deja-dup gnome-calendar gnome-mahjongg gnome-mines gnome-sudoku \
  gnome-todo  libreoffice-gnome libreoffice-impress libreoffice-math libreoffice-ogltrans \
  libreoffice-pdfimport libreoffice-style-breeze libreoffice-writer realmd remmina rhythmbox shotwell simple-scan sssd \
  sssd-tools thunderbird thunderbird-gnome-support totem usb-creator-gtk vino vagrant
${inst} openjdk-11-jre libreoffice-calc
${inst} gnome-tweaks

