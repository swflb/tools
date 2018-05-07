## do wanted installs
#
# @TODO add error checking
# @TODO add method to get user specified versions

install_dir="${HOME}/Downloads/installs"
echo "install idr: ${idir}"
mkdir "${idir}"

## chrome
cd ${install_dir}
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' | sudo tee /etc/apt/sources.list.d/google-chrome.list
sudo apt install google-chrome-stable

## sublime text3
cd ${install_dir}
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
sudo apt-get install apt-transport-https
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt-get update
sudo apt-get install sublime-text

####################################
## atom editor
cd ${install_dir}
curl -L https://packagecloud.io/AtomEditor/atom/gpgkey | sudo apt-key add -
sudo sh -c 'echo "deb [arch=amd64] https://packagecloud.io/AtomEditor/atom/any/ any main" > /etc/apt/sources.list.d/atom.list'
sudo apt-get update
sudo apt-get install atom

####################################
## opera browser
cd ${install_dir}
sudo add-apt-repository "deb http://deb.opera.com/opera/ stable non-free"
wget -O - http://deb.opera.com/archive.key | sudo apt-key add -
sudo apt-get update
sudo apt-get install opera-stable

####################################
## virutalbox
cd ${install_dir}
wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb https://download.virtualbox.org/virtualbox/debian stable non-free"
sudo apt update
sudo apt install virtualbox-5.2

####################################
## Visual studio code
#cd ${install_dir}
#get from https://go.microsoft.com/fwlink/?LinkID=760868
#sudo dpkg -i ./code*

####################################
# gitKraken
#cd "${idir}"
#wget https://www.gitkraken.com/download/linux-deb/
#sudo dpkg -i gitkraken-amd64.deb
#####################################
### spideroak
#cd ${install_dir}
#wget -O spideroakone.deb https://spideroak.com/getbuild?platform=ubuntu&arch=x86cmake_64
#sudo dpkg -i ./spideroak*

### spotify client
#cd ${install_dir}
#wget http://repository-origin.spotify.com/pool/non-free/s/spotify-client/spotify-client_1.0.42.145.g7a5a182e-37_amd64.deb
#sudo dpkg -i spotify-client_1.0.42.145.g7a5a182e-37_amd64.deb

## speedcrunch
#cd ${install_dir}
#git clone --recurse-submodules https://sethdh@bitbucket.org/sethdh/speedcrunch.git
#cd speedcrunch/src
#mkdir bld
#cd bld
#cmake -DCMAKE_CXX_FLAGS:STRING="-DSPEEDCRUNCH_PORTABLE" ..
#make -j6
#mkdir -p ~/bin/speedcrunch
#cp -r ./speedcrunch* ~/bin/speedcrunch/
#cp -r ./doc ~/bin/speedcrunch/
