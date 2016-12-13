# Configure the necessary Spark environment
# Simplified based on https://github.com/KristianHolsheimer/pyspark-setup-guide
import os
import sys

spark_home = os.environ.get("SPARK_HOME", '/opt/apache-spark')
spark_python = os.environ.get("PYTHONPATH", os.path.join(spark_home, "python"))

sys.path.insert(0, spark_home)
sys.path.insert(0, spark_python)
