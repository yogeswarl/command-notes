# TPU
### create a tpu-vm
```sh
 gcloud compute tpus tpu-vm create tpu-name \
--zone=tpu-zone \
--accelerator-type=v3-8 \
--version=tpu-vm-tf-2.10.0
```

### start a tpu-vm
```sh
  gcloud compute tpus tpu-vm start tpu-name --zone="TPU zone"
```
### ssh into a tpu-vm
```sh
  gcloud compute tpus tpu-vm ssh tpu-name --zone="TPU zone"
```
### stop a tpu-vm
```sh
  gcloud compute tpus tpu-vm stop tpu-name --zone="TPU zone"
```
### delete a tpu-vm
```sh
  gcloud compute tpus tpu-vm delete tpu-name --zone="TPU zone"
```
### list all available tpu-vm
```sh
  gcloud compute tpus tpu-vm list --zone="TPU Zone"
```
