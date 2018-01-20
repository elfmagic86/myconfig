# rvm, ruby
# ---

# https://gorails.com/setup/ubuntu/16.04#ruby-rvm
if [ ! -f ~/.rvm/scripts/rvm ]; then
    # NOTE: 지우고 다시 설치할때 사용한 경로, 
    # sudo rm -rf /usr/share/ruby-rvm /etc/rvmrc /etc/profile.d/rvm.sh ~/.rvm/ ~/.gnupg

    # rvm
    sudo apt-get install libgdbm-dev libncurses5-dev automake libtool bison libffi-dev

    gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
    curl -sSL https://get.rvm.io | bash -s stable

    # ruby
    source ~/.rvm/scripts/rvm

    rvm install 2.4.0
    rvm use 2.4.0 --default
    ruby -v

    # TODO rvm, ruby 사용하려면. 스크립트 실행해야함, 필요할까?
    #* To start using RVM you need to run `source ~/.rvm/scripts/rvm`
    #in all your open shell windows, in rare cases you need to reopen all shell windows.
fi

# ruby-dev
# ---
# https://www.brightbox.com/blog/2017/01/13/ruby-2-4-ubuntu-packages/
sudo apt-add-repository ppa:brightbox/ruby-ng
sudo apt-get update
sudo apt-get install ruby-dev ruby2.4-dev

# install programs by gem
# ---

# example
# source ~/.rvm/scripts/rvm
# gem install neovim
