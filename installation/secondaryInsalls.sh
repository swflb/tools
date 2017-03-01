## do wanted installs
#
# @TODO add error checking
# @TODO add method to get user specified versions

install_dir="${HOME}/Downloads/installs"
echo "install idr: ${idir}"
mkdir "${idir}"

## sublime text3
cd ${install_dir}
wget https://download.sublimetext.com/sublime-text_build-3126_amd64.deb
sudo dpkg -i ./sublime-text_build-3126_amd64.deb
#wget https://packagecontrol.io/Package%20Control.sublime-package
sudo cp ./Package*sublime* /opt/sublime_text/Packages/

####################################
## atom editor
cd ${install_dir}
wget https://github.com/atom/atom/releases/download/v1.11.2/atom-amd64.deb
sudo dpkg -i ./atom-amd*
####################################
## Visual studio code
cd ${install_dir}
#get from https://go.microsoft.com/fwlink/?LinkID=760868
sudo dpkg -i ./code*
####################################
# chrome
cd "${idir}"
#wget https://www.google.com/chrome/browser/desktop/index.html?platform=linux
#sudo dpkg -i google-chrome-stable_current_amd64.deb
####################################
# gitKraken
cd "${idir}"
wget https://www.gitkraken.com/download/linux-deb/
sudo dpkg -i gitkraken-amd64.deb
####################################
### spideroak
cd ${install_dir}
wget -O spideroakone.deb https://spideroak.com/getbuild?platform=ubuntu&arch=x86cmake_64
sudo dpkg -i ./spideroak*

### spotify client
cd ${install_dir}
wget http://repository-origin.spotify.com/pool/non-free/s/spotify-client/spotify-client_1.0.42.145.g7a5a182e-37_amd64.deb
sudo dpkg -i spotify-client_1.0.42.145.g7a5a182e-37_amd64.deb

## speedcrunch
cd ${install_dir}
#git clone --recurse-submodules https://sethdh@bitbucket.org/sethdh/speedcrunch.git
#cd speedcrunch/src
#mkdir bld
#cd bld
#cmake -DCMAKE_CXX_FLAGS:STRING="-DSPEEDCRUNCH_PORTABLE" ..
#make -j6
#mkdir -p ~/bin/speedcrunch
#cp -r ./speedcrunch* ~/bin/speedcrunch/
#cp -r ./doc ~/bin/speedcrunch/
