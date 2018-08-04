
# TODO PPA제거하자
# sudo add-apt-repository ppa:webupd8team/atom
# sudo apt update; sudo apt install atom


# 2.
# Debian based (Debian, Ubuntu, Linux Mint)
# Atom is only available for 64-bit Linux systems.
# Download atom-amd64.deb from the Atom releases page.
cd ~/Downloads
sudo dpkg --install atom-amd64.deb
# Launch Atom using the installed atom command.
# The Linux version does not currently automatically update so you will need to repeat these steps to upgrade to future releases.


# 3. https://github.com/atom/atom/blob/master/docs/build-instructions/linux.md
# prerequire
# sudo apt-get install build-essential git libsecret-1-dev fakeroot rpm libx11-dev libxkbfile-dev

# sudo add-apt-repository ppa:ubuntu-toolchain-r/test
# sudo apt-get update
# sudo apt-get install gcc-5 g++-5
# sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-5 80 --slave /usr/bin/g++ g++ /usr/bin/g++-5
# sudo update-alternatives --config gcc # choose gcc-5 from the list


# git clone https://github.com/atom/atom.git
# cd atom

# script/build
# To also install the newly built application, use --create-debian-package




