mkdir -p ~/.crowbar-build-cache/iso
cd ~/.crowbar-build-cache/iso

cd ~

if  [ -f ubuntu-12.04.3-server-amd64.iso ]
then
mv ubuntu-12.04.3-server-amd64.iso ~/.crowbar-build-cache/iso
mkdir -p ~/.crowbar-build-cache/barclamps/dell_raid/files/dell_raid/tools/
cd ~/.crowbar-build-cache/barclamps/dell_raid/files/dell_raid/tools/
wget http://www.lsi.com/downloads/Public/Host%20Bus%20Adapters/Host%20Bus%20Adapters%20Common%20Files/SAS_SATA_6G_P16/SAS2IRCU_P16.zip
wget http://www.lsi.com/downloads/Public/MegaRAID%20Common%20Files/8.07.07_MegaCLI.zip
fi

cd ~
git clone https://github.com/crowbar/crowbar.git
cd ~/crowbar

./dev setup --no-github
git config --global user.name "Oguz Yarimtepe"
git config --global user.email "oguzyarimtepe@gmail.com"

./dev fetch --no-github

cd barclamps
for bc in *; do (cd "$bc"; git checkout master; git reset HEAD README.empty-branch); done
cd ..
find ./ -name README.empty-branch -delete

./dev sync --no-github

# clean up any .empty-branch files first
cd ~/crowbar/barclamps
for bc in *; do (cd "$bc"; git clean -f -x -d 1>/dev/null 2>&1; git reset --hard 1>/dev/null 2>&1); done 

cd  ~/crowbar/
./dev switch roxy/openstack-os-build

# run sledge hammer seperatelly
#cd ~/crowbar
#sudo ./build_sledgehammer.sh

