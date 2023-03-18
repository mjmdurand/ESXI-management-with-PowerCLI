# ESXI parameters
$serverAddress = "192.168.50.30"

# Cloud image parameters
$datastoreOrigin = "SAN01"
$originDirectory = "ISOS/UBUNTU"
$cloudImageName = "20230317-jammy-server-cloudimg-amd64.vmdk"

# Cloud HDD must always be the 1st disk
$diskName = "Hard Disk 1"

# VM parameters
$datastoreVM = "SAN02"
$VMName = "test-VM"
$HDD = 20
$cpu = 2
$ram = 4
$network = "00 No Vlan"

# GuestId reference : 
# https://vdc-repo.vmware.com/vmwb-repository/dcr-public/6b586ed2-655c-49d9-9029-bc416323cb22/fa0b429a-a695-4c11-b7d2-2cbc284049dc/doc/vim.vm.GuestOsDescriptor.GuestOsIdentifier.html
$osId = "ubuntu64Guest"

# Disk copy parameters
$originPath = "[$datastoreOrigin] $originDirectory/$cloudImageName"
$destPath = "[$datastoreVM] $VMName/$VMName.vmdk"

# Cloud-Init base64 files
$cloudInitMetadataFile = "./conf/cloud-init-metadata-base64.yaml"
$cloudInitUserdataFile = "./conf/cloud-init-userdata-base64.yaml"

# Install PowerCLI module for powershell and disable ssl check
# REQUIRES ADMIN PERMISSION IN POWERSHELL TERMINAL
$installPowerCli = $false

# Prompt for Login/Password, only required once for a same PS terminal
$firstConnect = $false

# Create a new VM from scratch
$newVM = $false

# Delete a VM
$deleteVM = $false

# If the VM already exists and if you want to delete the HDD
$cleanBeforeStart = $true

# Copy .vdmk cloud from storage directory to VM
$copyDisk = $true

# Add the mandatory variables for cloud-init
$advancedConfig = $true

# Start the VM once all is finished
$startAtEnd = $true