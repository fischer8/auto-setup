#!/bin/bash

echo " "
echo " "
echo "---------- APPS INSTALL ----------"
sudo apt update 
sudo apt-get update 

sudo apt-get -y install wget
sudo apt-get -y install git
sudo apt-get -y install dconf-editor

sudo apt -y install curl
sudo apt -y install piper
sudo apt -y install xclip

sudo snap install nvim --classic
sudo snap install audacity 
sudo snap install gimp 
sudo snap install gthumb-unofficial 
sudo snap install steam 
sudo snap install chromium
sudo snap install brave 
sudo snap install postman
sudo snap install shotcut --classic
sudo snap install obs-studio
sudo snap install kolourpaint
sudo snap install vlc
sudo snap install code --classic
sudo snap install tldr

echo "STATUS OK"
echo " "
echo "---------- NVM INSTALL AND CONFIG ----------"

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  

nvm install node
nvm use node
nvm alias default node

echo "STATUS OK"
echo " "
echo "---------- BASH SCRIPTS AND DEFAULT CONFIG ----------"

echo "param=\$1
git add .
git commit -m \"\$param\"
git push -f" > xgit

echo "#!/bin/bash
cp -r ~/.config/nvim/ ~/Desktop/config
cd ~/Desktop/config/ && xgit nvim" > nvb

echo "xclip -selection clipboard" > xc

echo "alias \"vi\"=\"nvim\"
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

sudo chmod 663 .keymap.map
sudo chmod 663 ./.bash_aliases
sudo chmod 663 ./.gitconfig
sudo mv -f ./.keymap.map ~/
sudo mv -f ./.bash_aliases ~/
sudo mv -f ./.gitconfig ~/

sudo chmod 776 ./xgit
sudo chmod 776 ./nvb
sudo chmod 776 ./xc
sudo mv -f ./nvb /usr/bin/
sudo mv -f ./xgit /usr/bin/
sudo mv -f ./xc /usr/bin/

echo "STATUS OK"
echo " "
echo "---------- SSH KEY CONFIG ----------"

ssh-keygen -t ed25519 -C "fischxr@hotmail.com"

eval "$(ssh-agent -s)"

ssh-add ~/.ssh/id_ed25519
cat ~/.ssh/id_ed25519.pub | xc

echo " SSH PUB KEY COPIED TO CLIPBOARD "
echo " ADD TO GITHUB "
echo " https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account "
echo " PRESS ANY KEY ONLY AFTER ADDING THE SSH TO GITHUB "
read -s -n 1

git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

git clone --depth 1 git@github.com:fischer8/config.git ~/temporary/
mv -f ~/temporary/nvim/ ~/.config/
rm -rf ~/temporary/

mkdir ~/dev/
source ~/.bashrc

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

