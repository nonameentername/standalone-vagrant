#!/bin/sh

if [ $# -eq 0 ]; then
    echo "usage: $0 <gem-list>"
    exit 0;
fi

export JRUBY=$HOME/.m2/repository/org/jruby/jruby-complete/1.6.5/jruby-complete-1.6.5.jar

for gem in $@; do
    java -jar $JRUBY -S gem install -i ./target/gems --no-rdoc --no-ri $gem
done

jar cf lib/vagrant-gems.jar -C ./target/gems/ .

java -jar $JRUBY -rlib/vagrant-gems.jar -S gem list

mvn install:install-file -Dfile=./lib/vagrant-gems.jar -DgroupId=org.ruby -DartifactId=vagrant-gems -Dversion=1.0 -Dpackaging=jar
