# TODO: Create the github ssh key




git config --global user.email "markoates0@gmail.com"
git config --global user.name "Mark Oates"





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





cd ~/Repos
git clone git@github.com:chriskohlhoff/asio.git



cd ~/Repos
git clone https://github.com/google/googletest
cd googletest
mkdir build
cd build
cmake ..
make
make install




cd ~/Repos
git clone https://github.com/liballeg/allegro5.git
cd allegro5
mkdir build
cd build
cmake ..
make
# note that this step requires a sudo
sudo make install



cd ~/Repos
git clone git@github.com:jbeder/yaml-cpp.git
cd yaml-cpp
mkdir build
cd build
cmake ..
make


# Setup some useful stuff
brew install imagemagick


# Add dylibbundler (used for building binaries on mac)
brew install dylibbundler


# TODO: Consider adding this to system_test
brew install ffmpeg


# Setup gcloud
brew install --cask google-cloud-sdk

## Follow the on-screen instructions if any, log in, use the "game development workflow"
gcloud init


# Run system test
cd ~/Repos/blast
bin/programs/system_test


