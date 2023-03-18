try {
    $vm = Get-VM -Name "$VMName" -ErrorAction Stop
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
try {
    Remove-VM -VM "$vm" -DeletePermanently -Confirm:$false -ErrorAction Stop
}
catch {
    write-host "Failed to delete VM : $($vm.name)" -ForegroundColor black -BackgroundColor red
}