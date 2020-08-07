#!bin/sh
sudo apt-get update # To get the latest package lists
sudo DEBIAN_FRONTEND=noninteractive apt-get -y install hackrf\
    libhackrf-dev\
    libhackrf0\
    gnuradio\
    gnuradio-dev\
    gr-osmosdr\
    gr-osmosdr\
    gqrx-sdr
echo "wireshark-common wireshark-common/install-setuid boolean true" | sudo debconf-set-selections
sudo DEBIAN_FRONTEND=noninteractive apt-get -y install wireshark
sudo DEBIAN_FRONTEND=noninteractive apt-get -y install git\
    cmake\
    libboost-all-dev\
    libcppunit-dev\
    swig\
    doxygen\
    liblog4cpp5-dev\
    python-scipy\
    autoconf
git clone https://github.com/ptrkrysik/gr-gsm.git
cd gr-gsm
mkdir build
cd build
cmake ..
make
sudo make install
sudo ldconfig
mkdir ~/.gnuradio
rm ~/.gnuradio/config.conf
touch ~/.gnuradio/config.conf
echo -e "[grc]\nlocal_blocks_path=/usr/local/share/gnuradio/grc/blocks" >> ~/.gnuradio/config.conf
export M4=/path/to/gnu/m4
cd ..
cd ..
git clone https://github.com/scateu/kalibrate-hackrf.git
cd kalibrate-hackrf
./bootstrap
./configure
make
sudo make install
#etc