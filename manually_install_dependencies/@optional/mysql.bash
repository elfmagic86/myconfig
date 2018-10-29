# server(mariadb)
# https://downloads.mariadb.org/mariadb/repositories/#mirror=kaist&distro=Ubuntu&distro_release=xenial--ubuntu_xenial&version=10.2
sudo apt-get install software-properties-common
sudo apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0xF1656F24C74CD1D8
sudo add-apt-repository 'deb [arch=amd64,i386,ppc64el] http://ftp.kaist.ac.kr/mariadb/repo/10.2/ubuntu xenial main'

sudo apt update
sudo apt install mariadb-server

# no auto start
sudo systemctl disable mysql

# - 실행하기
# sudo /etc/init.d/mysql restart


# client
# https://zetawiki.com/wiki/%EC%9A%B0%EB%B6%84%ED%88%AC_MySQL_%ED%81%B4%EB%9D%BC%EC%9D%B4%EC%96%B8%ED%8A%B8_%EC%84%A4%EC%B9%98
sudo apt-get install mysql-client
