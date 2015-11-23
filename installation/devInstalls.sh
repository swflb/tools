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
#wget https://cmake.org/files/v3.4/cmake-3.4.0.tar.gz
#tar -xvzf cmake-3.4.0.tar.gz
cd cmake*
./configure
make -j6
sudo make install
######################################
## Qt
cd "${idir}"
#wget http://download.qt.io/official_releases/qt/5.5/5.5.1/qt-opensource-linux-x64-5.5.1.run
chmod +x ./qt-opensource-linux-x64-5.5.1.run
sudo ./qt-opensource-linux-x64-5.5.1.run
sudo cp "${HOME}/dev/tools/installation/qt.sh" /etc/profile.d/
######################################
##GLEW
cd "${idir}"
#wget http://sourceforge.net/projects/glew/files/glew/1.13.0/glew-1.13.0.tgz
#tar -xvzf glew-1.13.0.tgz
cd glew*
make
sudo make install
######################################
# ##hdf5
cd "${idir}"
#wget http://www.hdfgroup.org/ftp/HDF5/current/src/hdf5-1.8.16.tar.gz
#tar -xvzf hdf5-1.8.16.tar.gz
cd hdf5*
./configure --prefix=/opt/hdf5
make
sudo make install
######################################
# ## protobuf 3
cd "${idir}"
#git clone -b protoc-alpha-3.1 --recurse-submodules https://github.com/google/protobuf.git
cd protobuf
./autogen.sh
./configure
./make -j6
sudo make install
######################################
# ## externpro
#sudo mkdir /opt/externpro
#cd /opt/externpro
#sudo cp ~/Download/externpro-15.06.2-gcc49-64-Linux.sh ./
#sudo chmod 744 externpro-15.06.2-gcc49-64-Linux.sh
#sudo ./externpro-15.06.2-gcc49-64-Linux.sh
######################################
## zookeep
cd "${idir}"
#wget http://apache.cs.utah.edu/zookeeper/zookeeper-3.4.6/zookeeper-3.4.6.tar.gz
#tar -xvzf zookeeper-3.4.6.tar.gz
cd zookeep*
cd src/c
./configure
make -j6
sudo make install
######################################
# ## lirbkafka
cd "${idir}"
#git clone https://github.com/edenhill/librdkafka.git
cd librdkafka
./configure
make
sudo make install
######################################
# ##
## @TODO add option to remove all files if all is success


