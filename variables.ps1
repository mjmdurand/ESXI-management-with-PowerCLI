# ESXI parameters
$serverAddress = "10.0.0.0"

# Cloud image parameters
$datastoreOrigin = "OS"
$originDirectory = "ISO/Ubuntu"
$cloudImageName = "2023-03-17-jammy-server-cloudimg-amd64.vmdk"

# Cloud HDD must always be the 1st disk
$diskName = "Hard Disk 1"

# VM parameters
$datastoreVM = "DATA"
$VMName = "test-VM"
$HDD = 20
$cpu = 2
$ram = 4
$network = "LAN"

# GuestId reference : 
# https://vdc-repo.vmware.com/vmwb-repository/dcr-public/6b586ed2-655c-49d9-9029-bc416323cb22/fa0b429a-a695-4c11-b7d2-2cbc284049dc/doc/vim.vm.GuestOsDescriptor.GuestOsIdentifier.html
$osId = "ubuntu64Guest"

# Disk copy parameters
$originPath = "[$datastoreOrigin] $originDirectory/$cloudImageName"
$destPath = "[$datastoreVM] $VMName/$VMName.vmdk"

# Cloud-Init base64 files
$cloudInitNetworkFile = Get-Content "./cloud-init-metadata-base64.yaml"
$cloudInitUserdataFile = Get-Content "./cloud-init-userdata-base64.yaml"

# Install PowerCLI module for powershell ans disable ssl check
$installPowerCli = $false

# Prompt for Login/Password, only required once for a same PS terminal
$firstConnect = $false

# Create a new VM from scratch
$newVM = $false

# Delete a VM
$deleteVM = $false

# If the VM already exists and if you want to delete the HDD
$cleanBeforeStart = $false

# Copy .vdmk cloud from storage directory to VM
$copyDisk = $false

# Add the mandatory variables for cloud-init
$advancedConfig = $false

# Start the VM once all is finished
$startAtEnd = $false