#!/bin/bash
# PVPGN Pro Debian/Ubuntu Build script
# Licensed under BSD License by AUnited Co Ltd
$basedir=/tmp/pvpgn-server
mkdir $basedir
cd $basedir
read -p 'What version of pvpgn do you want to build [$basedir/binary]:' bindir
mkdir $bindir
read -p 'Which version of pvpgn do you want to build  [1.99.7.1/trunk]:' ver
read -p 'Do you want to enable MySQL support?  [Y/n]:' mysql
read -p 'Do you want to enable LUA support?  [Y/n]:' lua
myoption=""
luaoption=""
case #mysql in
y|Y|*) apt-get -y install mysql-server mysql-client libmysqlclient-dev && myoption="-D WITH_MYSQL=true"
n|N) myoption=""
esac
case $lua in
y|Y|*) apt-get -y install liblua5.1-0-dev && luaoption="-D WITH_LUA=true"
n|N) luaoption=""
esac
apt-get update
if [$ver=trunk]
apt-get install git
git clone https://github.com/pvpgn/pvpgn-server.git
fi
apt-get -y install cmake make build-essential zlib1g-dev
mkdir build
mkdir binary
cd build
cmake -D CMAKE_INSTALL_PREFIX=$bindir $myoption $luaoption ../
make && make install
https://github.com/pvpgn/pvpgn-server/archive/$ver-PRO.tar.gz