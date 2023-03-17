try {
    $vm = Get-VM -Name "$VMName" -ErrorAction Stop
}
catch {
    write-host "VM inexistante : $VMName"
}
# Stop Vm
try {
    #sleep 300
    Stop-VM -VM $vm -Confirm:$false -ErrorAction Stop
}
catch {
    write-host "
    Failed to stop VM : $($vm.Name)"
}
try {
    Remove-VM -VM "$vm" -DeletePermanently -Confirm:$false -ErrorAction Stop
}
catch {
    write-host "Failed to delete VM : $($vm.name)"
}