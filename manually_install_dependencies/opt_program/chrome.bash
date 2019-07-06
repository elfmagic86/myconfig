
# https://askubuntu.com/questions/510056/how-to-install-google-chrome

# Add Key:
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -

# Set repository:
echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' | sudo tee /etc/apt/sources.list.d/google-chrome.list

# Install package:
echo 'todo: `sudo apt-get update` 필수'
sudo apt-get update

sudo apt-get install -y google-chrome-stable
