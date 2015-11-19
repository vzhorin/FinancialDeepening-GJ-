#!/bin/bash

export PATH=$PATH:$VDS_HOME/bin
export CLASSPATH=
export GLOBUS_TCP_PORT_RANGE=50000,51000

echo "testing matlab"
swift -d -tc.file swift.conf/tc.data -sites.file swift.conf/sites.xml testmatlab.swift 