#!/bin/bash

echo " "
echo " "
echo "---------- APPS INSTALL ----------"
echo " "
echo " "

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

echo " "
echo " "
echo "---------- NVM INSTALL AND CONFIG ----------"
echo " "
echo " "

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  

nvm install node
nvm use node
nvm alias default node

echo " "
echo " "
echo "---------- NEOVIM CONFIG ----------"
echo " "
echo " "

git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

git clone git@github.com:fischer8/config.git ~/temporary/
mv -f ~/temporary/nvim/ ~/.config/
rm -rf ~/temporary/

mkdir ~/dev/
git clone git@github.com:fischer8/next-sanofi.git ~/dev/

echo " "
echo " "
echo "---------- BASH SCRIPTS AND DEFAULT CONFIG ----------"
echo " "
echo " "

echo "param=\$1
git add .
git commit -m \"\$param\"
git push -f" > xgit

echo "#!/bin/bash
cp -r ~/.config/nvim/ ~/Desktop/config
cd ~/Desktop/config/ && xgit nvim" > nvb

echo "xclip -selection clipboard" > xc

echo "alias \"vim\"=\"nvim\"
alias \"vi\"=\"nvim\"
alias \"nano\"=\"nvim\"
alias \"cl\"=\"clear\"
alias \"q\"=\"exit\"
alias \"tl\"=\"tldr\"" > .bash_aliases

echo "keycode 112 = Home
keycode 117 = End" > .keymap.map

echo "[user]
email = fischxr@hotmail.com
name = fischer8
[init]
defaultBranch = main" > .gitconfig

echo "
xmodmap ~/.keymap.map" >> $HOME/.bashrc

echo "
PS1='\\[\\e[38;2;0;95;135m\\]\\w\\[\\e[0m\\]\\\$ '" >> $HOME/.bashrc

echo " "
echo " "
echo "---------- MOVING CONFIG FILES ----------"
echo " "
echo " "

sudo chmod 663 .keymap.map
sudo chmod 663 ./.bash_aliases
sudo chmod 663 ./.gitconfig
sudo mv -f ./.keymap.map ~/
sudo mv -f ./.bash_aliases ~/
sudo mv -f ./.gitconfig ~/

echo " "
echo " "
echo "---------- MOVING BASH SCRIPTS ----------"
echo " "
echo " "

sudo chmod 776 ./xgit
sudo chmod 776 ./nvb
sudo chmod 776 ./xc
sudo mv -f ./nvb /usr/bin/
sudo mv -f ./xgit /usr/bin/
sudo mv -f ./xc /usr/bin/

echo " "
echo " "
echo " "
echo "----------------------------------------------"
echo "----------------------------------------------"
echo "----------------------------------------------"
echo "----------------------------------------------"
echo "-------------------- END ---------------------"
echo "----------------------------------------------"
echo "----------------------------------------------"
echo "----------------------------------------------"
echo "----------------------------------------------"

