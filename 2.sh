#!bin/sh
sudo DEBIAN_FRONTEND=noninteractive apt-get -y install cmake\
    libfftw3-dev\
    libmbedtls-dev\
    libboost-program-options-dev\
    libconfig++-dev\
    libsctp-dev
sudo DEBIAN_FRONTEND=noninteractive add-apt-repository -y ppa:bladerf/bladerf
sudo apt-get update
sudo DEBIAN_FRONTEND=noninteractive apt-get -y install bladerf\
    libsctp-dev\
    lksctp-tools\
    libuhd-dev\
    libuhd003\
    uhd-host\
    libosmosdr\
    librtlsdr\
    libmirisdr\
    libairspy\
    libbladeRF\
    libfreesrp
git clone https://github.com/srsLTE/srsLTE.git
cd srsLTE
mkdir build
cd build
cmake ../
make
make test
cd ..
cd ..
git clone git://git.osmocom.org/gr-osmosdr --single-branch --branch gr3.7
cd gr-osmosdr/
mkdir build
cd build/
cmake ../
make
sudo make install
sudo ldconfig
#etc