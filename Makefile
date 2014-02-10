JSVC := $(shell which jsvc)
PWD  := $(shell pwd)


target/my-daemon-0.1.0-SNAPSHOT-standalone.jar:
	lein uberjar

start: target/my-daemon-0.1.0-SNAPSHOT-standalone.jar
	sudo $(JSVC) -java-home "$$JAVA_HOME" \
	            -cp "$(PWD)/target/my-daemon-0.1.0-SNAPSHOT-standalone.jar" \
	            -outfile "$(PWD)/out.txt" \
	            my_daemon.core

stop:
	sudo $(JSV) -java-home "$$JAVA_HOME" \
	            -cp "$(PWD)/target/my-daemon-0.1.0-SNAPSHOT-standalone.jar" \
				-stop \
				my_daemon.core


.PHONY: \
	start \
	stop \
