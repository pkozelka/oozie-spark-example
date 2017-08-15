# Example of spark job running in Apache Oozie

## Prerequisities

- running instance of [Hortonworks Data Platform (HDP) 2.5](https://hortonworks.com/downloads/#sandbox)
- installed [Apache Maven](http://maven.apache.org) and Java 8 SDK
- for convenience, an OS with `ssh` and `make` commands available (Cygwin may work but was not tested)

### Sandbox server hostname

If your HDP is running locally on a NAT-connected virtual host, it is also good to modify `/etc/hosts` file like this:

    127.0.0.1	localhost sandbox.hortonworks.com

The HDP's default hostname `sandbox.hortonworks.com` is used at several places here.

### Sandbox server connection

For more convenience, I recommend to setup passwordless ssh connection to the oozie user at sandbox, 
by appending your public SSH key to the target to its `~/.ssh/authorized_keys` file.

## Makefile

is here to provide convenient access to useful commands:

- `make build` builds the oozie bundle
- `make deploy` copies it to the sandbox machine, and then into its HDFS
- `make run-remote` goes to the sandbox machine and runs the oozie job from there
- `make ssh` takes you to the sandbox server's commandline

### Run it all

by simply typing

    make build deploy run-remote

## Obsolete notes

sudo cp oozie-spark-example-bundle.tar.gz /home/oozie/
sudo chown oozie:oozie /home/oozie/oozie-spark-example-bundle.tar.gz

sudo -u hdfs hdfs dfs -mkdir -p /apps/oozie/
sudo -u hdfs hdfs dfs -chown oozie:hdfs /apps/oozie/
