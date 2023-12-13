
# Setup Github SSH Key

ssh-keygen -t rsa -b 4096 -C "markoates0@gmail.com"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa
clip < ~/.ssh/id_rsa.pub
# go to your github account now omg
Visit your GitHub account settings, go to "SSH and GPG keys," and click on "New SSH key." Paste the copied key into the "Key" field.
echo "Visit your GitHub account settings, go to \"SSH and GPG keys,\" and click on \"New SSH key.\" Paste the copied key into the \"Key\" field."
read -n 1 -s -r -p "Perss any key to continue..."
ssh-keyscan github.com >> ~/.ssh/known_hosts
ssh -T git@github.com


git config --global user.email "markoates0@gmail.com"
git config --global user.name "Mark Oates"


# Install vim first, in case something gets weird (vundle and plugins will be installed later)
pacman -Sy vim --noconfirm



pacman -S mingw-w64-x86_64-gcc --noconfirm
pacman -S mingw-w64-x86_64-gdb --noconfirm
pacman -S make --noconfirm
pacman -S mingw-w64-x86_64-cmake --noconfirm
pacman -S git --noconfirm
pacman -S mingw-w64-x86_64-pkg-config --noconfirm
pacman -S mingw-w64-x86_64-freetype --noconfirm
pacman -S mingw-w64-x86_64-libpng --noconfirm
pacman -S mingw-w64-x86_64-libjpeg-turbo --noconfirm
pacman -S mingw-w64-x86_64-libvorbis --noconfirm
pacman -S mingw-w64-x86_64-flac --noconfirm
pacman -S mingw-w64-x86_64-physfs --noconfirm
pacman -S mingw-w64-x86_64-dumb --noconfirm
pacman -S mingw-w64-x86_64-libtheora --noconfirm


# (restart terminal (because of cmake)) OR...
# This is needed because *cmake* is in this directory. The alternative is a reboot of the terminal.
export PATH=$PATH:/mingw64/bin



mkdir -p Releases
mkdir -p Repos
mkdir -p Builds



# Prepare for .dotfiles, blast, allegro_flare

pacman -S ncurses-devel --noconfirm
pacman -S mingw-w64-x86_64-yaml-cpp --noconfirm
pacman -S mingw-w64-x86_64-gtest  --noconfirm


cd ~/Repos
git clone git@github.com:MarkOates/.dotfiles.git

cd ~/Repos
git clone git@github.com:MarkOates/blast.git

cd ~/Repos
git clone git@github.com:allegroflare/allegro_flare.git

cd ~/Repos
git clone https://github.com/liballeg/allegro5.git



# symlink the rc files

cd ~
ln -sf ~/Repos/.dotfiles/.bashrc .bashrc
source .bashrc
ln -sf ~/Repos/.dotfiles/.vimrc .vimrc


# Install allegro5

cd ~/Repos
git clone https://github.com/liballeg/allegro5.git
cd allegro5
mkdir build
cd build
cmake -G "MSYS Makefiles" ..
make
make install



cd ~/Repos
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall



pacman -S mingw-w64-x86_64-imagemagick --noconfirm
pacman -S zip --noconfirm


