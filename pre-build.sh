sudo sed -ie "s/%sudo\tALL=(ALL:ALL) ALL/%sudo ALL=(ALL) NOPASSWD: ALL/g" /etc/sudoers
sudo apt-get update
sudo apt-get install git rpm ruby rubygems1.8 curl build-essential debootstrap \
mkisofs binutils markdown erlang debhelper python-pip \
build-essential libopenssl-ruby1.8 libssl-dev zlib1g-dev cabextract libxml-ruby  libxml2-dev

sudo gem install json net-http-digest_auth kwalify bundler rake rcov rspec --no-ri --no-rdoc

sudo pip install pip2pi
