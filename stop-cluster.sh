#!/bin/bash

$SPARK_HOME/sbin/stop-history-server.sh
$SPARK_HOME/sbin/stop-worker.sh
$SPARK_HOME/sbin/stop-master.sh

echo "Local cluster was stopped"