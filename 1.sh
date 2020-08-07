#!bin/sh
sudo apt-get update # To get the latest package lists
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y hackrf\
    libhackrf-dev\
    libhackrf0\
    gnuradio\
    gnuradio-dev\
    gr-osmosdr\
    gr-osmosdr\
    gqrx-sdr
echo "wireshark-common wireshark-common/install-setuid boolean true" | sudo debconf-set-selections
sudo DEBIAN_FRONTEND=noninteractive apt-get -y install wireshark
#etc