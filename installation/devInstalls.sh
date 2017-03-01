## do installs needed for development.
#
# @TODO add error checking
# @TODO add method to get user specified versions
#
idir="${HOME}/Downloads/installs"
echo "install idr: ${idir}"
mkdir "${idir}"
######################################
## cmake
cd "${idir}"
wget https://cmake.org/files/v3.6/cmake-3.6.1.tar.gz
tar -xvzf cmake-3.6.1.tar.gz
cd cmake*
./bootstrap
make -j6
sudo make install
######################################
## Qt
cd "${idir}"
wget http://download.qt.io/official_releases/qt/5.7/5.7.0/qt-opensource-linux-x64-5.7.0.run
chmod +x ./qt-opensource-linux-x64-5.7.0.run
./qt-opensource-linux-x64-5.7.0.run
sudo cp "${HOME}/dev/tools/installation/qt.sh" /etc/profile.d/
######################################
##GLEW
######################################
# ##hdf5
######################################
# ## externpro
sudo mkdir /opt/externpro
cd /opt/externpro
sudo cp ~/Downloads/externpro-16.01.1-gcc493-64-Linux.sh ./
sudo chmod 744 externpro-16.01.1-gcc493-64-Linux.sh
sudo ./externpro-16.01.1-gcc493-64-Linux.sh
sudo rm -f ./externpro-16.01.1-gcc493-64-Linux.sh
######################################
# ## ovsrpro
sudo mkdir /opt/ovsrpro
cd /opt/ovsrpro
sudo cp ~/Downloads/ovsrpro-16.06.1-gcc493-64-Linux.sh ./
sudo chmod 744 ovsrpro-16.06.1-gcc493-64-Linux.sh
sudo ./ovsrpro-16.06.1-gcc493-64-Linux.sh
sudo rm -f ./ovsrpro-16.06.1-gcc493-64-Linux.sh
######################################
## zookeep
######################################
# ## lirbkafka
######################################
# ##
## @TODO add option to remove all files if all is success


