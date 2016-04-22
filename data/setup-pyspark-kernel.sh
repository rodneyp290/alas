sudo jupyter kernelspec install /vagrant/data/jupyter/kernels/pyspark
mkdir -p $HOME/.ipython/profile_pyspark/startup/
cp /vagrant/data/jupyter/kernels/pyspark/00-pyspark-setup.py $HOME/.ipython/profile_pyspark/startup/
