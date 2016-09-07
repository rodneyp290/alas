pushd /vagrant/data/
pacman -Sq --needed --noconfirm python2-pip jupyter-notebook ipython2-notebook apache-ant jdk7-openjdk polkit

sudo -u vagrant packer -G --noconfirm --noedit hadoop
ls
chmod 777 hadoop
cd hadoop
sudo -u vagrant makepkg
ls
pacman -U --noconfirm `ls *.pkg.*`
cd ..
rm -r hadoop{,.tar.gz}
sudo -u vagrant packer -G --noconfirm --noedit apache-spark 
ls
chmod 777 apache-spark
cd apache-spark
sudo -u vagrant makepkg
ls
pacman -U --noconfirm `ls *.pkg.*`
echo export SPARK_HOME=/opt/apache-spark
cd ..
rm -r apache-spark{,.tar.gz}
popd
