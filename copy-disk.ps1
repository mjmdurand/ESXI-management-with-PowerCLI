try {
    $vm = Get-VM -Name "$VMName" -ErrorAction Stop
}
catch {
    write-host "VM inexistante : $VMName"
}
try {
    Get-HardDisk -Datastore "OS" -DatastorePath "$originPath" | Copy-HardDisk -DestinationPath "$destPath" -Force #-ErrorAction Stop
}
catch {
    write-host "
    Failed to copy Hard Disk, check your path and names
    Origine : $originPath
    Destination : $destPath"
}

#Add disk to VM
try {
New-HardDisk -VM $vm -diskPath $destPath -Confirm:$false -ErrorAction Stop
}
catch {
    write-host "
    Failed to add the Hard Disk to the VM 
    Disk : $destPath
    VM : $($vm.Name)"
}

try {
    $harddisk = Get-HardDisk -VM $vm | where {$_.Name -eq "$diskName"} -ErrorAction Stop
}
catch {
    write-host "Disk missing : $VMName"
}
# Increase Hard disk Size
try {
Set-HardDisk -HardDisk $harddisk -CapacityGB $extendedCapacity -Confirm:$false -ErrorAction Stop
}
catch {
    write-host "
    Failed to increase Hard Disk size 
    Disk : $($harddisk.Filename)
    Capacity : $extendedCapacity Go"
}

# guestinfo.metadata
try {
    New-AdvancedSetting -Entity $vm -Name "guestinfo.metadata" -Value "$cloudInitNetworkFile" -Confirm:$false -ErrorAction Stop
}
catch {
    write-host "guestinfo.metadata already exists, updating it instead"
    # Update guestinfo.network
    Get-AdvancedSetting -Entity $vm -Name "guestinfo.metadata" | Set-AdvancedSetting -Value "$cloudInitNetworkFile" -Confirm:$false
}
try {
    New-AdvancedSetting -Entity $vm -Name "guestinfo.metadata.encoding" -Value "base64" -Confirm:$false -ErrorAction Stop
}
catch {
    write-host "guestinfo.metadata.encoding already exists, updating it instead"
    # Update guestinfo.network
    Get-AdvancedSetting -Entity $vm -Name "guestinfo.metadata.encoding" | Set-AdvancedSetting -Value "base64" -Confirm:$false
}


# guestinfo.userdata
try {
    New-AdvancedSetting -Entity $vm -Name "guestinfo.userdata" -Value "$cloudInitUserdataFile" -Confirm:$false -ErrorAction Stop
}
catch {
    write-host "guestinfo.userdata already exists, updating it instead"
    # Update guestinfo.network
    Get-AdvancedSetting -Entity $vm -Name "guestinfo.userdata" | Set-AdvancedSetting -Value "$cloudInitUserdataFile" -Confirm:$false
}
try {
    New-AdvancedSetting -Entity $vm -Name "guestinfo.userdata.encoding" -Value "base64" -Confirm:$false -ErrorAction Stop
}
catch {
    write-host "guestinfo.userdata.encoding already exists, updating it instead"
    # Update guestinfo.network
    Get-AdvancedSetting -Entity $vm -Name "guestinfo.userdata.encoding" | Set-AdvancedSetting -Value "base64" -Confirm:$false
}