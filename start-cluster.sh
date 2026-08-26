#!/bin/bash
set -e
NUM_WORKERS=${1:-1}

function cleanup(){
    $SPARK_HOME/sbin/stop-history-server.sh
    $SPARK_HOME/sbin/stop-worker.sh
    $SPARK_HOME/sbin/stop-master.sh
    exit 1
}

trap cleanup ERR SIGINT SIGTERM

$SPARK_HOME/sbin/start-master.sh
sleep 5

echo "Starting workers"
export SPARK_WORKER_INSTANCES=$NUM_WORKERS
$SPARK_HOME/sbin/start-worker.sh spark://$(hostname):7077 --cores 2 --memory 2g 

echo "Starting history server"
$SPARK_HOME/sbin/start-history-server.sh

echo "Startup finished"