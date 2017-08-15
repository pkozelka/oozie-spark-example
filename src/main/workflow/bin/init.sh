#!/bin/bash

# Prepares HDFS for executing the job, assuming we are already in the job directory

HDIR="/apps/oozie/oozie-spark-example"
echo "Removing HDFS://$HDIR"
hdfs dfs -rm -R -f "$HDIR"

echo "Uploading new content to HDFS:$HDIR"
hdfs dfs -put "." "$HDIR"

