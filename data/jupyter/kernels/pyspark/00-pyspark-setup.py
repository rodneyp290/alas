# Configure the necessary Spark environment
import os
import sys

pyspark_submit_args = os.environ.get("PYSPARK_SUBMIT_ARGS","")

if not "pyspark-shell" in pyspark_submit_args :
	pyspark_submit_args += " pyspark-shell"

	os.environ["PYSPARK_SUBMIT_ARGS"]= pyspark_submit_args

	spark_home = os.environ.get("SPARK_HOME", '/opt/apache-spark')
	sys.path.insert(0, spark_home + "/python")

	# Add the py4j to the path.
	# You may need to change the version number to match your install
	sys.path.insert(0,os.path.join(spark_home, "python/lib/py4j-0.9-src.zip"))

	# Initialize PySpark
	major_version = sys.version_info.major
	pyspark_shell_file = os.path.join(spark_home, "python/pyspark/shell.py")

	if (major_version==2):
		execfile(pyspark_shell_file)
	elif (major_version==3):
		with open(pyspark_shell_file) as f:
			code = compile(f.read(), pyspark_shell_file, "exec")
			exec(code)
		else:
			error_str = "Unrecognised Python Version: {0}".format(major_version)
			raise EnvironmentError(1, error_str, "00-pyspark-setup.py")
