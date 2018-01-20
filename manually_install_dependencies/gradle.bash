
# https://howtoprogram.xyz/2016/09/06/install-gradle-ubuntu-16-04/

cd /tmp

# 
# file: https://services.gradle.org/distributions/
name="gradle-4.1"

if [ ! -d /usr/local/$name ]; then
	wget https://services.gradle.org/distributions/$name-bin.zip
	sudo unzip $name-bin.zip -d /usr/local
fi

sudo rm /usr/local/gradle
sudo ln -s /usr/local/$name /usr/local/gradle

#
cat > gradle.sh <<'EOF'
export GRADLE_HOME=/usr/local/gradle
export PATH=${GRADLE_HOME}/bin:${PATH}
EOF

sudo rm /etc/profile.d/gradle.sh
sudo mv gradle.sh /etc/profile.d/gradle.sh
