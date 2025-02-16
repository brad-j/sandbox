#!/usr/bin/env bash

# Prompt for VM ID
read -p "Enter VM ID (default: 5000): " VM_ID
VM_ID=${VM_ID:-5000}

read -p "Enter the network bridge (default: vmbr0): " BRIDGE

# Create the VM
BRIDGE=${BRIDGE:-vmbr0}
qm create $VM_ID --memory 2048 --core 2 --name ubuntu-cloud --net0 virtio,bridge=$BRIDGE

echo "VM created"

# Prompt for storage location
read -p "Enter the path of where your ISOs are stored (eg /mnt/pve/iso-storage/template/iso): " ISO_PATH

# Navigate to storage location
cd "$ISO_PATH"

ls -l "$ISO_PATH" && echo

read -p "Enter the name of the ISO (eg noble-server-cloudimg-amd64.img)" ISO_NAME

read -p "Enter the location to place the ISO (eg local-lvm or local-zfs)" STORAGE_PATH

# Import the disk and configure VM
qm importdisk $VM_ID $ISO_NAME $STORAGE_PATH
qm set $VM_ID --scsihw virtio-scsi-pci --scsi0 $STORAGE_PATH:vm-$VM_ID-disk-0
qm set $VM_ID --ide2 $STORAGE_PATH:cloudinit
qm set $VM_ID --boot c --bootdisk scsi0
qm set $VM_ID --serial0 socket --vga serial0

echo

echo "DON'T FORGET TO RESIZE DISK"
echo "Adjust memory and CPU as needed"
echo "You probably also want to change the CPU type to host"