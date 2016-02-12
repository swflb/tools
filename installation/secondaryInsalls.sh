## do wanted installs
#
# @TODO add error checking
# @TODO add method to get user specified versions

install_dir="${HOME}/Downloads/installs"
echo "install idr: ${idir}"
mkdir "${idir}"

##ubuntu-tweak
#cd ${install_dir}
#wget https://launchpad.net/ubuntu-tweak/0.8.x/0.8.7/+download/ubuntu-tweak_0.8.7-1%7Etrusty2_all.deb
#sudo dpkg -i ubuntu-tweak*

## sublime text3
cd ${install_dir}
wget https://download.sublimetext.com/sublime-text_build-3103_amd64.deb
sudo dpkg -i ./sublime-text_build-3103_amd64.deb
wget https://packagecontrol.io/Package%20Control.sublime-package
sudo cp ./Package*sublime* /opt/sublime_text/Packages/

## atom editor
cd ${install_dir}
wget https://github.com/atom/atom/releases/download/v1.2.3/atom-amd64.deb
sudo dpkg -i ./atom-amd*

### spideroak
cd ${install_dir}
wget -O spideroakone.deb https://spideroak.com/getbuild?platform=ubuntu&arch=x86_64
sudo dpkg -i ./spideroak*

### spotify client
cd ${install_dir}
wget http://repository-origin.spotify.com/pool/non-free/s/spotify-client/spotify-client_1.0.19.106.gb8a7150f_amd64.deb
sudo dpkg -i spotify-client_1.0.19.106.gb8a7150f_amd64.deb

## speedcrunch
cd ${install_dir}
git clone --recurse-submodules https://sethdh@bitbucket.org/sethdh/speedcrunch.git
cd speedcrunch/src
mkdir bld
cd bld
cmake -DCMAKE_CXX_FLAGS:STRING="-DSPEEDCRUNCH_PORTABLE" ..
make -j6
mkdir -p ~/bin/speedcrunch
cp -r ./speedcrunch* ~/bin/speedcrunch/
cp -r ./doc ~/bin/speedcrunch/
