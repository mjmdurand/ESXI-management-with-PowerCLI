#### WARNING
#### You need to upload the .vmdk cloud image
#### to your datastore FIRST
###############################################
#### Use official files like above
#### https://cloud-images.ubuntu.com/jammy/current/

# Variables
. ./conf/variables.ps1

# install PowerCLI from repositories
if ($installPowerCli) {
    . ./lib/install.ps1
}

# Esxi connection
if ($connectAtBegin) {
    . ./lib/connect.ps1
}

# Create a new VM
if ($deleteVM) {
    . ./lib/delete-vm.ps1
}

# Create a new VM
if ($newVM) {
    . ./lib/new-vm.ps1
}

if ($cleanBeforeStart) {
    . ./lib/clean.ps1
}

# Advanced config
if ($advancedConfig) {
    . ./lib/advanced-config.ps1
}


# Copy Hard disk
if ($copyDisk) {
    . ./lib/copy-disk.ps1
}

# Start VM
if ($startAtEnd) {
    . ./lib/start-vm.ps1
}

# Esxi disconnect
if ($disconnectAtEnd) {
    . ./lib/disconnect.ps1
}