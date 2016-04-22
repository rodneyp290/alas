# Configure the necessary Spark environment
import os
import sys

pyspark_submit_args = os.environ.get("PYSPARK_SUBMIT_ARGS","")
if not "pyspark-shell" in pyspark_submit_args :
    pyspark_submit_args += " pyspark-shell"
os.environ["PYSPARK_SUBMIT_ARGS"]= pyspark_submit_args
spark_home = os.environ.get('SPARK_HOME', None)
sys.path.insert(0, spark_home + "/python")
# Add the py4j to the path.
# You may need to change the version number to match your install
sys.path.insert(0 ,os.path.join(spark_home, 'python/lib/py4j-0.9-src.zip'))
# Initialize PySpark to predefine the Spark Context variable 'sc'
execfile(os.path.join(spark_home, 'python/pyspark/shell.py'))
