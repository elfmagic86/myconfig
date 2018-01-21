# program list
# ---

# basic
programs=(
	software-properties-common

    # sound
    pulseaudio pavucontrol

    # basic utils
    curl
    openssh-server
    git
    lynx
    htop
    tree
	inotify-tools

	# build
	build-essential
	cmake
	python-dev
	python3-dev

	# etc
    highlight # fzf.vim의 preview에서 의존함
    # nautilus-open-terminal # ubuntu14, 파일탐색기에서 우클릭하여 그위치로 터미널열기

	# screenshot
	scrot

	jq
)

# ppa update
# ---
sudo apt-get update

# programs install
# ---
# add-apt-repository
sudo apt-get install -y "${programs[@]}"
