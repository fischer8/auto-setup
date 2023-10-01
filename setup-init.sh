#!/bin/bash

echo "INICIANDO..."

sudo apt update 
sudo apt-get update 

sudo apt-get install wget
sudo apt-get install git
sudo apt-get -y install dconf-editor

sudo apt install curl
sudo apt install piper
sudo apt install neovim
sudo apt install xclip

sudo snap install audacity 
sudo snap install gimp 
sudo snap install gthumb-unofficial 
sudo snap install steam 
sudo snap install chrome 
sudo snap install brave 
sudo snap install postman
sudo snap install shotcut --classic
sudo snap install obs-studio
sudo snap install kolourpaint
sudo snap install vlc
sudo snap install code --classic
sudo snap install tldr

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  

nvm install node
nvm use node
nvm alias default node

git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

git clone git@github.com:fischer8/config.git ~/temporary/
mv -f ~/temporary/nvim/ ~/.config/
rm -rf ~/temporary/

mkdir ~/dev/
git clone git@github.com:fischer8/next-sanofi.git ~/dev/

content1="param=\$1
git add .
git commit -m \"\$param\"
git push -f"

content2="alias \"vim\"=\"nvim\"
alias \"vi\"=\"nvim\"
alias \"nano\"=\"nvim\"
alias \"cl\"=\"clear\"
alias \"q\"=\"exit\"
alias \"tl\"=\"tldr\""

content3="keycode 112 = Home
keycode 117 = End"

content4="
xmodmap ~/keymap.map"

content5="#!/bin/bash
cp -r ~/.config/nvim/ ~/Desktop/config
cd ~/Desktop/config/ && xgit nvim"

content6="xclip -selection clipboard"

content7="
PS1='\\[\\e[38;2;0;95;135m\\]\\w\\[\\e[0m\\]\\\$ '"

content8="[user]
email = fischxr@hotmail.com
name = fischer8
[init]
defaultBranch = main"

echo "$content1" > xgit
echo "$content5" > nvb
echo "$content6" > xc

echo "$content2" > .bash_aliases
echo "$content3" > .keymap.map
echo "$content8" > .gitconfig

echo "$content7" >> $HOME/.bashrc
echo "$content4" >> $HOME/.bashrc

sudo chmod 663 .keymap.map
sudo chmod 663 ./.bash_aliases
sudo chmod 663 ./.gitconfig
sudo mv -f ./.keymap.map ~/
sudo mv -f ./.bash_aliases ~/
sudo mv -f ./.gitconfig ~/

sudo chmod 776 ./xgit
sudo chmod 776 ./nvb
sudo chmod 776 ./xclip
sudo mv -f ./nvb /usr/bin/
sudo mv -f ./xgit /usr/bin/
sudo mv -f ./xclip /usr/bin/

echo " "
echo " "
echo " "
echo "----------------------------------------------"
echo "----------------------------------------------"
echo "----------------------------------------------"
echo "----------------------------------------------"
echo "----------------- CONCLUIDO ------------------"
echo "----------------------------------------------"
echo "----------------------------------------------"
echo "----------------------------------------------"
echo "----------------------------------------------"

