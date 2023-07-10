# Storage

# create a bucket 
``` bash
gcloud storage buckets create gs://{bucket_name}
```

# push data to cloud
``` bash
gsutil cp {files} gs://{bucket_name}/{folder}
```
# pull data from cloud
``` bash
gsutil cp gs://{bucket_name}/{folder}/{files} {local_folder}
```