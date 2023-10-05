#!/bin/bash

echo " "
echo " "
echo "---------- APPS INSTALL ----------"
sudo apt update 
sudo apt-get update 
sudo add-apt-repository ppa:graphics-drivers/ppa

sudo apt-get -y install wget
sudo apt-get -y install git
sudo apt-get -y install dconf-editor

sudo apt -y install curl
sudo apt -y install piper
sudo apt -y install xclip
sudo apt -y install lua5.3

sudo snap install nvim --classic
sudo snap install audacity 
sudo snap install gimp 
sudo snap install gthumb-unofficial 
sudo snap install chromium
sudo snap install brave 
sudo snap install postman
sudo snap install shotcut --classic
sudo snap install obs-studio
sudo snap install kolourpaint
sudo snap install vlc
sudo snap install code --classic
sudo snap install tldr

curl -o ~/Downloads/steam.deb https://cdn.akamai.steamstatic.com/client/installer/steam.deb
sudo dpkg -i ~/Downloads/steam.deb

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

gsettings set org.gnome.Terminal.Legacy.Settings confirm-close false
gsettings set org.gnome.mutter center-new-windows true

echo "param=\$1
git add .
git commit -m \"\$param\"
git push -f" | sudo tee /usr/bin/xgit

echo "#!/bin/bash
cp -r ~/.config/nvim/* ~/backup/nvim/
cd ~/.config/nvim/ && xgit nvim" | sudo tee /usr/bin/nvb

echo "xclip -selection clipboard" | sudo tee /usr/bin/xc

echo "alias \"vi\"=\"nvim\"
alias \"nano\"=\"nvim\"
alias \"cl\"=\"clear\"
alias \"q\"=\"exit\"
alias \"tl\"=\"tldr\"" > $HOME/.bash_aliases

echo "keycode 112 = Home
keycode 117 = End" > $HOME/.keymap.map

echo "
xmodmap ~/.keymap.map

PS1='\\[\\e[38;2;0;95;135m\\]\\w\\[\\e[0m\\]\\\$ '" >> $HOME/.bashrc

sudo chmod 664 ~/.keymap.map ~/.bash_aliases
sudo chmod 776 /usr/bin/xgit /usr/bin/nvb /usr/bin/xc

mkdir -p ~/backup/nvim/ ~/obs/remux ~/obs/mp4/ ~/dev/ ~/shotcut/raw/ ~/shotcut/mp4/

echo "STATUS OK"
echo " "
echo "---------- GENERATING GITHUB SSH KEY ----------"

read -p "Github email: " EMAIL
ssh-keygen -t ed25519 -C "$EMAIL"

eval "$(ssh-agent -s)"

ssh-add ~/.ssh/id_ed25519
cat ~/.ssh/id_ed25519.pub | xc

echo " "
echo "--  SSH PUB KEY COPIED TO CLIPBOARD  --"
echo "--  ADD TO GITHUB  --"
echo " https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account "
echo " CONTINUE ONLY AFTER ADDING THE SSH TO GITHUB (PRESS ANY KEY)"
read -s -n 1

git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

mkdir ~/.config/nvim/
git clone --depth 1 git@github.com:fischer8/nvim.git ~/.config/nvim/

sudo apt install nvidia-driver-535
source ~/.bashrc

echo " "
echo " "
echo "----- END -----"
echo " "
echo " "
echo " PRESS ANY KEY TO REBOOT "
read -s -n 1
sudo reboot -f

