#!/bin/bash

sudo update-alternatives --remove-all gcc
sudo update-alternatives --remove-all g++
sudo update-alternatives --remove-all cpp
sudo update-alternatives --remove-all cc
sudo update-alternatives --remove-all c++

sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-7 20
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-6 10

sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-7 20
sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-6 10

sudo update-alternatives --install /usr/bin/cpp cpp /usr/bin/cpp-7 20
sudo update-alternatives --install /usr/bin/cpp cpp /usr/bin/cpp-6 10

sudo update-alternatives --install /usr/bin/cc cc /usr/bin/gcc 30
sudo update-alternatives --set cc /usr/bin/gcc

sudo update-alternatives --install /usr/bin/c++ c++ /usr/bin/g++ 30
sudo update-alternatives --set c++ /usr/bin/g++

sudo update-alternatives --set gcc "/usr/bin/gcc-6"
sudo update-alternatives --set g++ "/usr/bin/g++-6"
sudo update-alternatives --set cpp "/usr/bin/cpp-6"

#sudo update-alternatives --set gcc "/usr/bin/gcc-7"
#sudo update-alternatives --set g++ "/usr/bin/g++-7"
#sudo update-alternatives --set cpp "/usr/bin/cpp-7"


### list all manually configured alternatives:
# for i in /etc/alternatives/*; do
#  LANG=C update-alternatives --display "${i#/etc/alternatives/}"
# done 2>/dev/null | awk '/manual.mode/{print $1}'
