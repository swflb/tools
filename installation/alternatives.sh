sudo update-alternatives --remove-all gcc 
sudo update-alternatives --remove-all g++
sudo update-alternatives --remove-all cpp
sudo update-alternatives --remove-all cc
sudo update-alternatives --remove-all c++

sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-4.9 10
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-5 20

sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-4.9 10
sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-5 20

sudo update-alternatives --install /usr/bin/cpp cpp /usr/bin/cpp-4.9 10
sudo update-alternatives --install /usr/bin/cpp cpp /usr/bin/cpp-5 20

sudo update-alternatives --install /usr/bin/cc cc /usr/bin/gcc 30
sudo update-alternatives --set cc /usr/bin/gcc

sudo update-alternatives --install /usr/bin/c++ c++ /usr/bin/g++ 30
sudo update-alternatives --set c++ /usr/bin/g++

sudo update-alternatives --set gcc "/usr/bin/gcc-4.9"
sudo update-alternatives --set g++ "/usr/bin/g++-4.9"
sudo update-alternatives --set cpp "/usr/bin/cpp-4.9"

