cd ~
git clone https://github.com/crowbar/crowbar.git
cd ~/crowbar

./dev setup --no-github
git config --global user.name "Oguz Yarimtepe"
git config --global user.email "oguzyarimtepe@gmail.com"

./dev fetch --no-github
#
cd barclamps
#
for bc in *; do (cd "$bc"; git checkout master; git reset HEAD README.empty-branch); done
#
cd ..
#
find ./ -name README.empty-branch -delete
#
./dev sync --no-github

./dev switch roxy/openstack-os-build
