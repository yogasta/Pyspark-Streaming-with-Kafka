# Use the official Jupyter Data Science Notebook as the base image
FROM jupyter/datascience-notebook:latest

# Switch to root to install system dependencies
USER root

# Install OpenJDK 11 (required for Spark) and wget
RUN apt-get update && apt-get install -y openjdk-11-jdk wget && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Set JAVA_HOME environment variable
ENV JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64

# Install Spark
ENV SPARK_HOME=/opt/spark

RUN wget https://archive.apache.org/dist/spark/spark-3.5.0/spark-3.5.0-bin-hadoop3.tgz && \
    tar -xvzf spark-3.5.0-bin-hadoop3.tgz && \
    mv spark-3.5.0-bin-hadoop3 ${SPARK_HOME} && \
    rm spark-3.5.0-bin-hadoop3.tgz

# Set Spark environment variables
ENV PATH=${PATH}:${SPARK_HOME}/bin
ENV PYTHONPATH=${SPARK_HOME}/python:${SPARK_HOME}/python/lib/py4j-0.10.9.7-src.zip

# Switch back to the default Jupyter user
USER ${NB_UID}

# Install Python packages
RUN pip install confluent-kafka protobuf fastavro pyspark==3.5.0 psycopg2-binary

# Set the working directory
WORKDIR /home/jovyan/work

# Expose the Jupyter port
EXPOSE 8888

# Start Jupyter Notebook
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root"]