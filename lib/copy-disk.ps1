try {
    $vm = Get-VM -Name "$VMName" -ErrorAction Stop
}
catch {
    write-host "Unexisting VM : $VMName" -ForegroundColor black -BackgroundColor red
}
try {
    Get-HardDisk -Datastore "$datastoreOrigin" -DatastorePath "$originPath" | Copy-HardDisk -DestinationPath "$destPath" -Force #-ErrorAction Stop
}
catch {
    write-host "
    Failed to copy Hard Disk, check your path and names
    Origin : $originPath
    Destination : $destPath" -ForegroundColor black -BackgroundColor red
}

#Add disk to VM
try {
New-HardDisk -VM $vm -diskPath $destPath -Confirm:$false -ErrorAction Stop
}
catch {
    write-host "
    Failed to add the Hard Disk to the VM 
    Disk : $destPath
    VM : $($vm.Name)" -ForegroundColor black -BackgroundColor red
}

try {
    $harddisk = Get-HardDisk -VM $vm | where {$_.Name -eq "$diskName"} -ErrorAction Stop
}
catch {
    write-host "Disk missing : $VMName" -ForegroundColor black -BackgroundColor red
}
# Increase Hard disk Size
try {
Set-HardDisk -HardDisk $harddisk -CapacityGB $HDD -Confirm:$false -ErrorAction Stop
}
catch {
    write-host "
    Failed to increase Hard Disk size 
    Disk : $($harddisk.Filename)
    Capacity : $HDD Go" -ForegroundColor black -BackgroundColor red
}