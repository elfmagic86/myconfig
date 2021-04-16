
# https://triest.tistory.com/48
# /etc/profile.d/jdk.sh 파일 변경해야함
echo install openJDK 11
sudo add-apt-repository ppa:openjdk-r/ppa
sudo apt-get update
sudo apt install openjdk-11-jdk

# todo 다른버전 필요시 https://stackoverflow.com/questions/52504825/how-to-install-jdk-11-under-ubuntu
