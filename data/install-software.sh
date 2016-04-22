sudo pacman -Sq --needed --noconfirm python2-pip jupyter ipython2-notebook
ln -s /bin/pip /bin/pip2
sudo -u vagrant packer -S --noconfirm --noedit apache-spark 
