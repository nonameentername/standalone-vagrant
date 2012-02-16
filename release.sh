#!/bin/sh

export ROOTDIR=$(dirname $(readlink -f $0))

$ROOTDIR/gem2jar.sh jruby-openssl vagrant
mvn clean package
cp $ROOTDIR/target/standalone-vagrant-1.0-SNAPSHOT.jar $ROOTDIR/build/
