# ubuntu16에서 stable 버전은 일반적인 방법으로 설치가 안되는것 같음
# https://askubuntu.com/a/932189

# beta v5
cd /tmp
wget https://repo.skype.com/latest/skypeforlinux-64.deb
sudo dpkg -i skypeforlinux-64.deb
sudo apt install -f
