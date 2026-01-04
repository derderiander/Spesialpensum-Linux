#!/bin/bash

sudo virt-install \
  --name gw \
  --memory 1024 \
  --vcpus 1 \
  --disk size=20,format=qcow2 \
  --os-variant ubuntu22.04 \
  --network network=default \
  --network network=skole-lan \
  --graphics none \
  --console pty,target_type=serial \
  --location '/var/lib/libvirt/images/ubuntu-22.04-server-amd64.iso' \
  --extra-args 'console=ttyS0,115200n8 serial'

sudo virt-install \
  --name infra \
  --memory 2048 \
  --vcpus 2 \
  --disk size=20,format=qcow2 \
  --os-variant ubuntu22.04 \
  --network network=skole-lan \
  --graphics none \
  --console pty,target_type=serial \
  --location '/var/lib/libvirt/images/ubuntu-22.04-server-amd64.iso' \
  --extra-args 'console=ttyS0,115200n8 serial'

sudo virt-install \
  --name file \
  --memory 4096 \
  --vcpus 2 \
  --disk size=40,format=qcow2 \
  --os-variant ubuntu22.04 \
  --network network=skole-lan \
  --graphics none \
  --console pty,target_type=serial \
  --location '/var/lib/libvirt/images/ubuntu-22.04-server-amd64.iso' \
  --extra-args 'console=ttyS0,115200n8 serial'