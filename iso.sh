cd ~/crowbar
sudo ./build_sledgehammer.sh

cd ~/crowbar
#
#./dev switch roxy/openstack-os-build
#
sudo chown -R oguz:oguz ~/.crowbar-build-cache/barclamps/provisioner
sudo cp -ra ~/.crowbar-build-cache/barclamps/provisioner/tftpboot ~/.crowbar-build-cache
sudo chown oguz:oguz ~/.crowbar-build-cache/sledgehammer/

cd ~/crowbar
#
sh -c 'DEBUG=1 ./dev build --os ubuntu-12.04 --update-cache' ~/build.log
