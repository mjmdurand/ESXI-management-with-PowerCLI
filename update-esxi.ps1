# Variables
. ./conf/variables.ps1

# Esxi connection
if ($connectAtBegin) {
    . ./lib/connect.ps1
}

# Variables
try {
    $VMName = Read-Host -Prompt "Please provide an existing VM name on that host "
    $vm = Get-VM -Name "$VMName" -ErrorAction Stop
}
catch {
    write-host "Unexisting VM : $VMName" -ForegroundColor black -BackgroundColor red
}
try {    
    $vmHost = Get-VMHost -VM "$vm" -ErrorAction Stop
}
catch {
    write-host "Failed to find VMHost : $vm" -ForegroundColor black -BackgroundColor red
}

# Enable httpClient
. ./lib/enable-http-client.ps1

# stop all VM
. ./lib/stop-all-vm.ps1

# Enable Maintenance mode
. ./lib/enable-maintenance.ps1

# Update ESXI
# Search Updates
. ./lib/search-updates.ps1

# Build Updates list
. ./lib/build-updates.ps1

# Apply Updates
. ./lib/apply-updates.ps1

# Disable httpClient
. ./lib/disable-http-client.ps1

# Disable Maintenance mode
. ./lib/disable-maintenance.ps1

# start all VM
. ./lib/start-all-vm.ps1

# Esxi disconnect
if ($disconnectAtEnd) {
    . ./lib/disconnect.ps1
}

write-host "To apply the update, please restart your host." -ForegroundColor black -BackgroundColor yellow