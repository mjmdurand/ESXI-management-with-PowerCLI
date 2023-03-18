try {
    $vm = Get-VM -Name "$VMName" -ErrorAction Stop
    $harddisk = Get-HardDisk -VM $vm | where {$_.Name -eq "$diskName"}
}
catch {
    write-host "Unexisting VM : $VMName" -ForegroundColor black -BackgroundColor red
}
# Stop Vm
try {
    #sleep 300
    Stop-VM -VM $vm -Confirm:$false -ErrorAction Stop
}
catch {
    write-host "
    Failed to stop VM : $($vm.Name)" -ForegroundColor black -BackgroundColor red
}

# Remove and delete disk
try {
    Remove-HardDisk -HardDisk $harddisk -DeletePermanently -Confirm:$false -ErrorAction Stop
}
catch {
    write-host "
    Failed to remove and delete Hard Disk
    Disk : $($harddisk.Filename)" -ForegroundColor black -BackgroundColor red
}