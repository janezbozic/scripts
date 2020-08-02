#!/bin/bash

pacman-mirrors --fasttrack
pacman -Syyu --noconfirm

pacman -S $(comm -12 <(pacman -Slq | sort) <(sort scripts/pkglistPacman.txt)) --noconfirm

sudo -u $SUDO_USER yay -S --skippgpcheck --noconfirm $(comm -12 <(yay -Slq | sort) <(sort scripts/pkgListYay.txt))

sudo -u $SUDO_USER sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

snap install code --classic
#snap install intellij-idea-ultimate --classic
#snap install android-studio --classic

sudo -u $SUDO_USER echo "bash -c zsh" >> ~/.bashrc

sudo -u $SUDO_USER mkdir .addonsZSH
cd .addonsZSH/
sudo -u $SUDO_USER git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
sudo -u $SUDO_USER echo "source ${PWD}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ../.zshrc
sudo -u $SUDO_USER git clone https://github.com/zsh-users/zsh-autosuggestions
sudo -u $SUDO_USER echo "source ${PWD}/zsh-autosuggestions/zsh-autosuggestions.zsh"
sudo -u $SUDO_USER echo "source ${PWD}/zsh-autosuggestions/zsh-autosuggestions.zsh" >> ../.zshrc
cd ..

sudo -u $SUDO_USER yay -S zsh-theme-powerlevel10k --noconfirm
sudo -u $SUDO_USER echo 'source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme' >> .zshrc
