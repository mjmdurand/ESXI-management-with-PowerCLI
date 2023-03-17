#### WARNING
#### You need to upload the .vmdk cloud image
#### to your datastore FIRST
###############################################
#### Use official files like above
#### https://cloud-images.ubuntu.com/jammy/current/

# Variables
. ./variables.ps1

# install PowerCLI from repositories
if ($installPowerCli) {
    . ./install.ps1
}

# Esxi connection
if ($firstConnect) {
    . ./connect.ps1
}

# Create a new VM
if ($deleteVM) {
    . ./delete-vm.ps1
}

# Create a new VM
if ($newVM) {
    . ./new-vm.ps1
}

if ($cleanBeforeStart) {
    . ./clean.ps1
}


# Copy Hard disk
if ($copyDisk) {
    . ./copy-disk.ps1
}

# Start VM
if ($startAtEnd) {
    . ./start-vm.ps1
}