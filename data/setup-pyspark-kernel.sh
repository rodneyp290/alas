sudo jupyter kernelspec install /vagrant/data/jupyter/kernels/pyspark
mkdir -p $HOME/.ipython/profile_pyspark/startup/
cp /vagrant/data/jupyter/kernels/pyspark/00-pyspark-setup.py $HOME/.ipython/profile_pyspark/startup/

echo spark.cores.max				4 	> /usr/share/apache-spark/conf/spark-defaults.conf
echo spark.driver.memory			6g 	>> /usr/share/apache-spark/conf/spark-defaults.conf
echo spark.executor.memory			1g 	>> /usr/share/apache-spark/conf/spark-defaults.conf
echo spark.memory.storageFraction	0.7 >> /usr/share/apache-spark/conf/spark-defaults.conf
