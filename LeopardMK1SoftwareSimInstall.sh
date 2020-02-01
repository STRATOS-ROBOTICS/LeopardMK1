


#Install dependancies

sudo apt install mesa-common-dev freeglut3-dev coinor-libipopt-dev libblas-dev liblapack-dev gfortran liblapack-dev coinor-libipopt-dev cmake gcc build-essential libglib2.0-dev default-jdk python-all-dev liblua5.1-dev golang doxygen python-epydoc



#Clone  MIT Minicheetah software
git clone https://github.com/mit-biomimetics/Cheetah-Software.git
cd Cheetah-Software

#Eigen library
wget https://gitlab.com/libeigen/eigen/-/archive/3.3.7/eigen-3.3.7.zip
unzip eigen-3.3.7.zip
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


#build 
cd scripts # for now, you must actually go into this folder
./make_types.sh # you may see an error like `rm: cannot remove...` but this is okay
cd ..
mkdir build
cd build
cmake .. # there are still some warnings here
make -j

