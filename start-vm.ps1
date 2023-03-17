try {
    $vm = Get-VM -Name "$VMName" -ErrorAction Stop
}
catch {
    write-host "VM inexistante : $VMName"
}
# Start Vm
try {
Start-VM -VM $vm -Confirm:$false -ErrorAction Stop
}
catch {
    write-host "
    Failed to start VM : $($vm.Name)"
}