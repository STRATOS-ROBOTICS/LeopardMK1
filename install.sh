


# Install Oracle JDK

##
## First, you'll have to download JDK from Oracle. Unfortunately it cannot be done
## via command line, only by visiting Oracle site, accepting license etc.
## The page is https://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html
## The file you need is jdk-8u241-linux-x64.tar.gz
## Download it at put into the directory where you run this script from.
##

sudo tar -zxvf jdk-8u241-linux-x64.tar.gz -C /usr/lib/jvm/
sudo update-alternatives --install /usr/bin/java java /usr/lib/jvm/jdk1.8.0_241/bin/java 3
sudo update-alternatives --set java /usr/lib/jvm/jdk1.8.0_241/bin/java
sudo update-alternatives --install /usr/bin/javac javac /usr/lib/jvm/jdk1.8.0_241/bin/javac 3
sudo update-alternatives --set javac /usr/lib/jvm/jdk1.8.0_241/bin/javac
sudo update-alternatives --install /usr/bin/jar jar /usr/lib/jvm/jdk1.8.0_241/bin/jar 3
sudo update-alternatives --set jar /usr/lib/jvm/jdk1.8.0_241/bin/jar
export JAVA_HOME=/usr/lib/jvm/jdk1.8.0_241/

#Install dependancies

sudo apt install mesa-common-dev freeglut3-dev coinor-libipopt-dev libblas-dev liblapack-dev gfortran liblapack-dev coinor-libipopt-dev cmake gcc build-essential libglib2.0-dev python-all-dev liblua5.1-dev golang doxygen python-epydoc git

#Clone  MIT Minicheetah software
git clone https://github.com/mit-biomimetics/Cheetah-Software.git
cd Cheetah-Software

#Eigen library
wget https://gitlab.com/libeigen/eigen/-/archive/3.3.7/eigen-3.3.7.zip
unzip eigen-3.3.7.zip
cd eigen-3.3.7

mkdir build
cd build
cmake ..
sudo make install
cd ../..

#lcm library
wget https://github.com/lcm-proj/lcm/releases/download/v1.4.0/lcm-1.4.0.zip
unzip lcm-1.4.0.zip
cd lcm-1.4.0

mkdir build
cd build
cmake ..
make
sudo make install
cd ..
cd ..

#Qt creator
wget http://mirrors.ukfast.co.uk/sites/qt.io/archive/qt/5.10/5.10.0/qt-opensource-linux-x64-5.10.0.run
chmod +x qt-opensource-linux-x64-5.10.0.run
./qt-opensource-linux-x64-5.10.0.run
ln -s ~/Qt5.10.0 ~/Qt ## In the case the default installation directory was chosen

#build 
cd scripts # for now, you must actually go into this folder
./make_types.sh # you may see an error like `rm: cannot remove...` but this is okay
cd ..
mkdir build
cd build
cmake .. # No warnings anymore
make -j4

sudo ldconfig
