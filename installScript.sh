#!/bin/bash

pacman-mirrors --fasttrack
pacman -Syyu --noconfirm

pacman -S < pkgListPacman.txt --noconfirm

sudo -u $SUDO_USER yay -S < pkgListYay.txt --noconfirm

sudo -u $SUDO_USER sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

snap install code --classic
#snap install intellij-idea-ultimate --classic
#snap install android-studio --classic

sudo -u $SUDO_USER echo "bash -c zsh" >> ~/.bashrc

sudo -u $SUDO_USER mkdir .addonsZSH
sudo -u $SUDO_USER cd .addonsZSH
sudo -u $SUDO_USER git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
sudo -u $SUDO_USER echo "source ${(q-)PWD}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc
sudo -u $SUDO_USERgit clone https://github.com/zsh-users/zsh-autosuggestions
sudo -u $SUDO_USER echo "source ${(q-)PWD}/zsh-autosuggestions/zsh-autosuggestions.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc
sudo -u $SUDO_USER cd ..

sudo -u $SUDO_USER yay -Sy --noconfirm zsh-theme-powerlevel10k-git
sudo -u $SUDO_USER echo 'source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme' >>! ~/.zshrc

sudo -u $SUDO_USER python3 gnomeShortcutsScript.py 'Terminology' 'terminology' '<Super>T'
sudo -u $SUDO_USER python3 gnomeShortcutsScript.py 'Files' 'nautilus' '<Super>F'
sudo -u $SUDO_USER python3 gnomeShortcutsScript.py 'Chrome' 'google-chrome-stable' '<Super>C'

