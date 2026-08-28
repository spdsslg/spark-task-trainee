## Starting a cluster locally
To start the cluster, use provided bash scripts. They use `.sh` scripts provided with the spark engine.
`start-cluster` and `stop-cluster` scripts use environment variable `SPARK_HOME`, which might be undefined on your computer. `SPARK_HOME` is the directory where spark engine lives on your machine.

If using provided scripts:

```bash
#to start cluster
./start-cluster.sh
#execute code from notebook
#to stop cluster when no more needed
./stop-cluster.sh
```

`start-cluster.sh` takes one parameter, which is the number of workers it will create. Workers have 2GB of RAM and 2 cores each.