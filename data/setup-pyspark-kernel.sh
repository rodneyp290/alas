sudo jupyter kernelspec install /vagrant/data/jupyter/kernels/pyspark
mkdir -p $HOME/.ipython/profile_pyspark/startup/
cp /vagrant/data/jupyter/kernels/pyspark/00-pyspark-setup.py $HOME/.ipython/profile_pyspark/startup/

echo spark.cores.max				4 	> /etc/apache-spark/spark-defaults.conf
echo spark.driver.memory			6g 	>> /etc/apache-spark/spark-defaults.conf
echo spark.executor.memory			1g 	>> /etc/apache-spark/spark-defaults.conf
echo spark.memory.storageFraction	0.7 >> /etc/apache-spark/spark-defaults.conf
