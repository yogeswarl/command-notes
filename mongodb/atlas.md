# Using MongoDB Atlas notes.

## Register and setup a cluster
``` sh 
atlas auth register 
```

``` sh
atlas setup --clusterName myAtlasClusterEDU --provider AWS --currentIp --skipSampleData --username myAtlasDBUser --password myatlas-001 | tee atlas_cluster_details.txt
```

Atlas can be used as an interactive UI to create, update and delete databases, collections and documents.
Its a unified data platform to handle mongodb databases over the cloud with 3 different tiers, for shared and dedicatedd clusters.

