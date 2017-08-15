OOZIE_USERHOST=oozie@sandbox.hortonworks.com
OOZIE_PORT=2222

all: build

build:
	mvn clean verify

deploy:
	scp -P $(OOZIE_PORT) target/oozie-spark-example-bundle.tar.gz $(OOZIE_USERHOST):/tmp/
	ssh -p $(OOZIE_PORT) $(OOZIE_USERHOST) 'tar zxf /tmp/oozie-spark-example-bundle.tar.gz -C ~/applications && cd ~/applications/oozie-spark-example && ./bin/init.sh'

run-remote:
	ssh -p $(OOZIE_PORT) $(OOZIE_USERHOST) 'cd ~/applications/oozie-spark-example && ./bin/run.sh'

ssh:
	ssh -p $(OOZIE_PORT) $(OOZIE_USERHOST)
