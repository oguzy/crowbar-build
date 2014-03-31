#cd ~
#sudo chown -R oguz:oguz ~/.crowbar-build-cache/barclamps


#cd ~/.crowbar-build-cache
#ln -s ~/.crowbar-build-cache/barclamps/provisioner/tftpboot .


sudo chown -R oguz:oguz ~/.crowbar-build-cache/tftpboot
sudo chown oguz:oguz ~/.crowbar-build-cache/sledgehammer
cd ~/crowbar
#./dev sync --no-github
#./dev switch roxy/openstack-os-build
#script -c 'DEBUG=1 ./dev build --os ubuntu-12.04 --update-cache --no-switch' ~/build-roxy-1.x.log
script -c 'DEBUG=1 ./dev build --os ubuntu-12.04 --update-cache' ~/build-roxy-1.x.log

