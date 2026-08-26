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

$SPARK_HOME/sbin/start-master.sh -h 127.0.0.1
sleep 10

echo "Starting workers"

SPARK_WORKER_INSTANCES=$NUM_WORKERS SPARK_LOCAL_IP="127.0.0.1" $SPARK_HOME/sbin/start-worker.sh spark://localhost:7077 --cores 2 --memory 2g 

echo "Starting history server"
$SPARK_HOME/sbin/start-history-server.sh

echo "Startup finished"