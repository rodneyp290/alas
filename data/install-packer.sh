pushd /vagrant/data/
pacman -S --needed --noconfirm base-devel sudo wget git expac jshon
echo '%wheel ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers
sudo -u vagrant mkdir packer
cd packer
wget https://aur.archlinux.org/cgit/aur.git/plain/PKGBUILD?h=packer
mv PKGBUILD?h=packer PKGBUILD
sudo -u vagrant makepkg
pacman -U --noconfirm `ls packer*.pkg.*`
cd ..
rm -dR packer
popd  
