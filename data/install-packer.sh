pushd /data/
sudo pacman -Sq --needed --noconfirm wget git expac jshon
sudo -u vagrant mkdir packer
cd packer
wget https://aur.archlinux.org/cgit/aur.git/plain/PKGBUILD?h=packer
mv PKGBUILD?h=packer PKGBUILD
sudo -u vagrant makepkg
sudo pacman -U --noconfirm packer-20150808-1-any.pkg.tar.xz
cd ..
sudo rm -dR packer
popd  