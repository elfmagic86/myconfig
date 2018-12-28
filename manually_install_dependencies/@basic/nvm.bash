# nvm, node, npm
# ---

# 1. 설치
curl -ko- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash

# 2. bashrc에 없으면 추가
# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm

# 3. node 최신버전 설치 및 사용
# nvm install --lts


# upgrade
# (
  # cd "$NVM_DIR"
  # git fetch --tags origin
  # git checkout `git describe --abbrev=0 --tags --match "v[0-9]*" $(git rev-list --tags --max-count=1)`
# ) && \. "$NVM_DIR/nvm.sh"


# yarn
# ---

curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list


sudo apt-get update && sudo apt-get install --no-install-recommends yarn
