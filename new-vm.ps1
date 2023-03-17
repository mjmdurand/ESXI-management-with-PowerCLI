try {
New-VM `
-Name $VMName `
-Datastore $datastoreName `
-NumCPU 2 `
-MemoryGB 4 `
-DiskGB 10 `
-NetworkName "LAN" `
-GuestId ubuntu64Guest `
-ErrorAction Stop
# GuestId reference : 
# https://vdc-repo.vmware.com/vmwb-repository/dcr-public/6b586ed2-655c-49d9-9029-bc416323cb22/fa0b429a-a695-4c11-b7d2-2cbc284049dc/doc/vim.vm.GuestOsDescriptor.GuestOsIdentifier.html
}
catch {
    write-host "
    Failed to create VM
    Name : $VMName
    Datastore : $datastoreName"
}

try {
    $vm = Get-VM -Name "$VMName" -ErrorAction Stop
    $harddisk = Get-HardDisk -VM $vm | where {$_.Name -eq "$diskName"}
}
catch {
    write-host "VM inexistante : $VMName"
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