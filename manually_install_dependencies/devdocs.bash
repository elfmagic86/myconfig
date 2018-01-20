# https://github.com/Thibaut/devdocs
# ===

# install
# ---

rep_path=~/.devdocs

if [ ! -d $rep_path ]; then
    git clone https://github.com/Thibaut/devdocs.git $rep_path

    # deps
    sudo apt-get install -y libcurl3
    rvm install 2.4.1

    # install on ruby 2.4.1
    source ~/.rvm/scripts/rvm # https://stackoverflow.com/a/11105199
    rvm use 2.4.1
    gem install bundler

    cd $rep_path
    bundle install # depends on gemfile
fi

# usage
# ---

# use 2.4.1
source ~/.rvm/scripts/rvm
rvm use 2.4.1

# download doc
cd $rep_path
thor docs:download --default
thor docs:download d3@4
