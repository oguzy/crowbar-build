#set locale
#append LC_ALL="en_US.UTF-8" to /etc/default/locale

sudo sed -ie "s/%sudo\tALL=(ALL:ALL) ALL/%sudo ALL=(ALL) NOPASSWD: ALL/g" /etc/sudoers
sudo apt-get update
sudo apt-get install \
git rpm ruby rubygems1.9 curl build-essential debootstrap \
mkisofs binutils markdown erlang debhelper python-pip \
build-essential libssl-dev zlib1g-dev \
libpq-dev byobu cabextract ruby1.9.1-dev libxml-ruby1.9.1
sudo apt-get install cabextract libmysqlclient-dev
sudo apt-get install libsqlite-dev libsqlite-dev libsqlite-dev
sudo gem install ruby1.9.3-dev builder bluecloth
sudo gem install json net-http-digest_auth kwalify bundler delayed_job delayed_job_active_record
sudo rake rspec pg --no-ri --no-rdoc
sudo gem install rcov -v 0.9.11
mkdir -p ~/.crowbar-build-cache/barclamps/dell_raid/files/dell_raid/tools/
cd ~/.crowbar-build-cache/barclamps/dell_raid/files/dell_raid/tools/
wget http://www.lsi.com/downloads/Public/Host%20Bus%20Adapters/Host%20Bus%20Adapters%20Common%20Files/SAS_SATA_6G_P16/SAS2IRCU_P16.zip
wget http://www.lsi.com/downloads/Public/MegaRAID%20Common%20Files/8.07.07_MegaCLI.zip

sudo update-alternatives --config ruby

sudo wget --quiet -O - http://apt.postgresql.org/pub/repos/apt/ACCC4CF8.asc | sudo apt-key add -
sudo cp ~/roxy/pgdg.list /etc/apt/sources.list.d/pgdg.list
sudo apt-get update
sudo apt-get install postgresql-9.3 pgadmin3

mkdir -p ~/.crowbar-build-cache/iso

mv ~/ubuntu-12.04.3-server-amd64.iso ~/.crowbar-build-cache/iso
mv ~/dell_bios_roxy ~/.crowbar-build-cache/barclamps/dell_bios
sudo chown -R oguz:oguz ~/.crowbar-build-cache
find ~/.crowbar-build-cache/barclamps/dell_bios -type d -exec chmod 755 '{}' \;

#
sudo pip install pip2pi

#config postgresql
#Add the following section at the beginning of the following file /etc/postgresql/9.3/main/pg_hba.conf
#local  all   all    trust
#And change Port like this in /etc/postgresql/9.3/main/postgresql.conf
#port = 5439
#sudo service postgresql restart
#sudo createuser -s -d -U postgres -p 5439 crowbar
