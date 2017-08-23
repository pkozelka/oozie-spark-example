OOZIE_USERHOST=oozie@sandbox.hortonworks.com
OOZIE_PORT=2222

NAME=oozie-spark-example

all: build

build: target/$(NAME)-bundle.tar.gz

target/$(NAME)-bundle.tar.gz: $(shell find src pom.xml -type f)
	mvn clean verify

deploy:
	cat target/$(NAME)-bundle.tar.gz | \
	  ssh -p $(OOZIE_PORT) $(OOZIE_USERHOST) 'rm -rf ~/applications/$(NAME); mkdir -p ~/applications; \
	  tar zx -C ~/applications && cd ~/applications/$(NAME) && ./bin/init.sh'

run-remote:
	ssh -p $(OOZIE_PORT) $(OOZIE_USERHOST) 'cd ~/applications/$(NAME) && bin/run.sh'

ssh:
	ssh -p $(OOZIE_PORT) $(OOZIE_USERHOST)
