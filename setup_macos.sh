# TODO: Create the github ssh key
# This script assumes you have cloned .dotfiles on your system:
#
# mkdir -p ~/Repos
# cd ~/Repos
# git clone git@github.com:MarkOates/.dotfiles.git
#
# Having done this you can now run this setup script


ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa
pbcopy < ~/.ssh/id_rsa.pub

echo "Visit your GitHub account settings, go to \"SSH and GPG keys,\" and click on \"New SSH key.\" Paste the copied key into the \"Key\" field."
read -n 1 -s -r -p "Once you have done this, Press any key to continue..."


# Add "github.com" to known hosts and confirm connection
ssh-keyscan github.com >> ~/.ssh/known_hosts

git config --global user.email "markoates0@gmail.com"
git config --global user.name "Mark Oates"

ssh -T git@github.com


# Make some dirs

mkdir -p ~/Releases
mkdir -p ~/Repos
mkdir -p ~/Builds


# symlink dotfiles

cd ~
ln -sf ~/Repos/.dotfiles/.vimrc .vimrc
ln -sf ~/Repos/.dotfiles/.zshrc .zshrc
source .zshrc
ln -sf ~/Repos/.dotfiles/.bashrc .bashrc
source .bashrc


# Install packages
# Add homebrew

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

(echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> /Users/markoates/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

brew install freeimage
brew install webp
brew install flac
brew install dumb
brew install libvorbis
brew install opus
brew install freetype
brew install physfs
brew install enet
brew install theora
# brew install minimp3  # not a thing?

brew update

brew install cmake


# Install 3rd party repos that are used

cd ~/Repos
git clone git@github.com:chriskohlhoff/asio.git


cd ~/Repos
git clone https://github.com/google/googletest
cd googletest
mkdir build
cd build
cmake ..
make
sudo make install


cd ~/Repos
git clone https://github.com/liballeg/allegro5.git
cd allegro5
mkdir build
cd build
cmake ..
make
sudo make install


cd ~/Repos
git clone git@github.com:jbeder/yaml-cpp.git
cd yaml-cpp
mkdir build
cd build
cmake ..
make


# Install and setup VIM
cd ~/Repos
git clone git@github.com:MarkOates/first_vim_plugin.git

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
mkdir ~/.vimbackup/


# Setup some useful stuff
brew install imagemagick

# Add dylibbundler (used for building binaries on mac)
brew install dylibbundler

# TODO: Consider adding this ffmpeg to system_test
brew install ffmpeg

# Setup gcloud
brew install --cask google-cloud-sdk

## Follow the on-screen instructions if any, log in, use the "game development workflow"
gcloud init


## Now clone the project repos

## Note that .dotfiles is already expected to have been cloned
#cd ~/Repos
#git clone git@github.com:MarkOates/.dotfiles.git

cd ~/Repos
git clone git@github.com:MarkOates/blast.git

cd ~/Repos
git clone git@github.com:allegroflare/allegro_flare.git

cd ~/Repos
git clone git@github.com:MarkOates/me.git

cd ~/Repos
git clone git@github.com:MarkOates/hexagon.git


# Build blast

cd ~/Repos/blast
make programs -j6 && make


# Run system test
cd ~/Repos/blast
./bin/programs/system_test
status


# Build other projects

#cd ~/Repos/hexagon
#make

#cd ~/Repos/allegro_flare
#make



