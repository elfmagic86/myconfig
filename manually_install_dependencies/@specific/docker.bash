# install docker CE stable
# ===

# ENV: Xenial 16.04 (LTS), x86_64(amd64)

# add repository
# ---

# Install packages to allow apt to use a repository over HTTPS
sudo apt-get install \
	apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

# gpg
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo apt-key fingerprint 0EBFCD88

# stable repository
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"


# install docker ce
# ---
# install latest
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io

# uninstall
# sudo apt-get remove docker docker-engine docker.io

# test
echo 'for test: >sudo docker run hello-world'


# # optional
# # ===

# # docker에 sudo 권한주기, 권한 준 후 재로긴필요
# sudo groupadd docker
# sudo usermod -aG docker $USER


# # no autostart
# # : 시작하기 위해서 단순히 docker 명령을 사용하면됨.
# sudo systemctl disable docker

# # restart
