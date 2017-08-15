sudo cp oozie-example-bundle.tar.gz /home/oozie/
sudo chown oozie:oozie /home/oozie/oozie-example-bundle.tar.gz

sudo -u hdfs hdfs dfs -mkdir -p /apps/oozie/
sudo -u hdfs hdfs dfs -chown oozie:hdfs /apps/oozie/