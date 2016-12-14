sudo jupyter kernelspec install /vagrant/data/jupyter/kernels/pyspark

mkdir -p /home/vagrant/.ipython/profile_pyspark/startup/
cp /vagrant/data/jupyter/kernels/pyspark/00-pyspark-setup.py /home/vagrant/.ipython/profile_pyspark/startup/

mkdir /home/vagrant/.jupyter/
# creates the password of 'alas' for the jupyter notebook server
#  See http://jupyter-notebook.readthedocs.io/en/latest/public_server.html to create your own unique password
echo "c.NotebookApp.password = 'sha1:241bb833225b:8bd5fd1393a441d327a8992fa1349e146e3c5af6'" >> /home/vagrant/.jupyter/jupyter_notebook_config.py

echo "jupyter notebook --no-browser --ip=0.0.0.0" >> /home/vagrant/run-jupyter

chown -R vagrant:vagrant /home/vagrant/.ipython/
chown -R vagrant:vagrant /home/vagrant/.jupyter/
chown -R vagrant:vagrant /home/vagrant/run-jupyter
chmod +x /home/vagrant/run-jupyter

echo spark.cores.max				4 	> /etc/apache-spark/spark-defaults.conf
echo spark.driver.memory			6g 	>> /etc/apache-spark/spark-defaults.conf
echo spark.executor.memory			1g 	>> /etc/apache-spark/spark-defaults.conf
echo spark.memory.storageFraction	0.7 >> /etc/apache-spark/spark-defaults.conf
