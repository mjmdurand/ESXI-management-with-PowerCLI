try {
New-VM `
-Name $VMName `
-Datastore $datastoreVM `
-NumCPU $cpu `
-MemoryGB $ram `
-NetworkName $network `
-GuestId $osId `
-ErrorAction Stop
}
catch {
    write-host "
    Failed to create VM, check if your license allow this action
    Name : $VMName
    Datastore : $datastoreOrigin
    CPU : $cpu
    Memory : $ram
    Network : $network
    GuestId : $osId"
}

try {
    $vm = Get-VM -Name "$VMName" -ErrorAction Stop
    $harddisk = Get-HardDisk -VM $vm | where {$_.Name -eq "$diskName"}
}
catch {
    write-host "Unexisting VM : $VMName"
}

# Remove and delete disk
try {
    Remove-HardDisk -HardDisk $harddisk -DeletePermanently -Confirm:$false -ErrorAction Stop
}
catch {
    write-host "
    Failed to remove and delete Hard Disk
    Disk : $($harddisk.Filename)"
}