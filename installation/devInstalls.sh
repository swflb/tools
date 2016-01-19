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
wget https://cmake.org/files/v3.4/cmake-3.4.0.tar.gz
tar -xvzf cmake-3.4.0.tar.gz
cd cmake*
./bootstrap
make -j6
sudo make install
######################################
## Qt
cd "${idir}"
wget http://download.qt.io/official_releases/qt/5.5/5.5.1/qt-opensource-linux-x64-5.5.1.run
chmod +x ./qt-opensource-linux-x64-5.5.1.run
./qt-opensource-linux-x64-5.5.1.run
sudo cp "${HOME}/dev/tools/installation/qt.sh" /etc/profile.d/
######################################
##GLEW
cd "${idir}"
wget http://sourceforge.net/projects/glew/files/glew/1.13.0/glew-1.13.0.tgz
tar -xvzf glew-1.13.0.tgz
cd glew*
make
sudo make install
######################################
# ##hdf5
cd "${idir}"
wget http://www.hdfgroup.org/ftp/HDF5/current/bin/linux-centos7-x86_64-gcc483/hdf5-1.8.16-linux-centos7-x86_64-gcc483-shared.tar.gz
tar -xvzf hdf5-1.8.16-linux-centos7-x86_64-gcc483-shared.tar.gz
cd hdf5-1.8.16*
sudo rm -rf /opt/hdf5
sudo mkdir /opt/hdf5
sudo cp -r ./* /opt/hdf5
######################################
# ## externpro
sudo mkdir /opt/externpro
cd /opt/externpro
sudo cp ~/Download/externpro-15.10.2-gcc49-64-Linux.sh ./
sudo chmod 744 externpro-15.10.2-gcc49-64-Linux.sh
sudo ./externpro-15.10.2-gcc49-64-Linux.sh
######################################
## zookeep
cd "${idir}"
wget http://apache.cs.utah.edu/zookeeper/zookeeper-3.4.7/zookeeper-3.4.7.tar.gz
tar -xvzf zookeeper-3.4.7.tar.gz
cd zookeep*
cd src/c
./configure
make -j6
sudo make install
######################################
# ## lirbkafka
cd "${idir}"
git clone https://github.com/edenhill/librdkafka.git
git checkout 0.9.0
cd librdkafka
./configure
make
sudo make install
######################################
# ##
## @TODO add option to remove all files if all is success


