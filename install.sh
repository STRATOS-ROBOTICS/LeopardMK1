


# Install Oracle JDK

##
## First, you'll have to download JDK from Oracle. Unfortunately it cannot be done
## via command line, only by visiting Oracle site, accepting license etc.
## The page is https://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html
## The file you need is jdk-8u281-linux-x64.tar.gz
## Download it at put into the directory where you run this script from.
##

cat header1
sudo apt update

sleep 5
sudo apt install default-jre -y
sleep 5 

sudo apt install default-jdk -y

sudo tar -zxvf jdk-8u281-linux-x64.tar.gz -C /usr/lib/jvm/
sudo update-alternatives --install /usr/bin/java java /usr/lib/jvm/jdk1.8.0_281/bin/java 3
sudo update-alternatives --set java /usr/lib/jvm/jdk1.8.0_281/bin/java
sudo update-alternatives --install /usr/bin/javac javac /usr/lib/jvm/jdk1.8.0_281/bin/javac 3
sudo update-alternatives --set javac /usr/lib/jvm/jdk1.8.0_281/bin/javac
sudo update-alternatives --install /usr/bin/jar jar /usr/lib/jvm/jdk1.8.0_281/bin/jar 3
sudo update-alternatives --set jar /usr/lib/jvm/jdk1.8.0_281/bin/jar
export JAVA_HOME=/usr/lib/jvm/jdk1.8.0_281/
sleep 5
#Install dependancies

sudo apt install freeglut3-dev -y



sudo apt install golang -y
sleep 5
sudo apt install doxygen -y
sleep 5
sudo apt install libglib2.0-dev -y
sleep 5
sudo apt install python-all-dev -y
sleep 5
sudo apt install liblua5.1-0-dev -y
sleep 5
sudo apt install build-essential -y
sleep 5
sudo apt install gcc -y
sleep 5
sudo apt install coinor-libipopt-dev -y
sleep 5

sudo apt install gfortran -y
sleep 5
sudo apt install liblapack-dev -y
sleep 5
sudo apt install libblas-dev -y
sleep 5
sudo apt install mesa-common-dev -y
sleep 5
sudo apt install git -y
sleep 5
sudo apt install cmake -y

sleep 5
sudo apt install qtbase5-dev -y
sleep 5

######QTCREATOR

wget http://mirrors.ukfast.co.uk/sites/qt.io/archive/qt/5.12/5.12.8/qt-opensource-linux-x64-5.12.8.run


chmod +x qt-opensource-linux-x64-5.12.8.run
./qt-opensource-linux-x64-5.12.8.run




###### for increase speed of compile with swap file thanks elpimous     ////maybe dont need to test
sudo sysctl vm.swappiness=5
sudo swapoff -av
sudo swapon -av

sudo fallocate -l 4g /file.swap
sudo chmod 600 /file.swap
sudo mkswap /file.swap
sudo swapon /file.swap
sudo swapoff /swapfile
sudo rm /swapfile

sleep 5

#Clone  MIT Minicheetah software
sudo git clone https://github.com/mit-biomimetics/Cheetah-Software.git
sudo chmod -R 777 Cheetah-Software
cd Cheetah-Software

#epydoc
wget -q http://prdownloads.sourceforge.net/epydoc/epydoc-3.0.1.tar.gz
sudo gunzip epydoc-3.0.1.tar.gz
sudo tar -xvf epydoc-3.0.1.tar
sleep 5


#Eigen library
wget https://gitlab.com/libeigen/eigen/-/archive/3.3.7/eigen-3.3.7.zip
unzip eigen-3.3.7.zip
cd eigen-3.3.7
sleep 5
sudo mkdir build
cd build
sudo cmake ..
sudo make install
cd ../..
sleep 5

#lcm library
wget https://github.com/lcm-proj/lcm/releases/download/v1.4.0/lcm-1.4.0.zip
unzip lcm-1.4.0.zip
cd lcm-1.4.0
sleep 5
sudo mkdir build
cd build
sudo cmake ..
sudo make
sudo make install
cd ../..
sleep 5








#build 
cd scripts # for now, you must actually go into this folder
./make_types.sh # you may see an error like `rm: cannot remove...` but this is okay
cd ..
sudo mkdir build
sudo chmod -R 777 build



sed -i '5 i set(Qt5Core_DIR /Qt5.12.8/5.12.8/gcc_64/lib/cmake/Qt5Core)' sim/CMakeLists.txt

sed -i '6 i set(Qt5Widgets_DIR /Qt5.12.8/5.12.8/gcc_64/lib/cmake/Qt5Widgets)' sim/CMakeLists.txt

sed -i '7 i set(Qt5Gamepad_DIR /Qt5.12.8/5.12.8/gcc_64/lib/cmake/Qt5Gamepad)' sim/CMakeLists.txt

sleep 5

cd build






###finally
sudo cmake .. # No warnings anymore
#####SET DIRECTORY FOR CMAKE AND QT5


sleep 5

sudo make ### # or sudo make -j4 for better spped but need 8go or ram
sleep 10 
sudo ldconfig -v ##### for error while loading shared libraries: liblcm.so.1: cannot open shared object file: No such file or directory
sleep 5

######then run the simulator
sudo ./sim/sim

####IN OTHER WINDOW RUN 
###sudo ./user/MIT_Controller/mit_ctrl m s   ###https://www.programmersought.com/article/96114805353/

