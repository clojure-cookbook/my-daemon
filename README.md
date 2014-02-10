# my-daemon

A simple Apache Commons Daemon-compliant Clojure application. See the
accompanying recipe in the [Clojure Cookbook](http://clojure-cookbook.com).

## Usage

To run the application as a daemon, install `jsvc` or `procrun` (untested) and execte the following commands:

```sh
$ lein uberjar
Created /tmp/my-daemon/target/my-daemon-0.1.0-SNAPSHOT.jar
Created /tmp/my-daemon/target/my-daemon-0.1.0-SNAPSHOT-standalone.jar

$ sudo jsvc -java-home "$JAVA_HOME" \
            -cp "$(pwd)/target/my-daemon-0.1.0-SNAPSHOT-standalone.jar" \
            -outfile "$(pwd)/out.txt" \
            my_daemon.core
````

To stop the application:

```sh
$ sudo jsvc -java-home "$JAVA_HOME" \
            -cp "$(pwd)/target/my-daemon-0.1.0-SNAPSHOT-standalone.jar" \
            -stop \
            my_daemon.core
## License

Copyright © 2013 O'Reilly Media, Ryan Neufeld

Distributed under the Eclipse Public License either version 1.0 or (at
your option) any later version.
