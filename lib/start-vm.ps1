try {
    $vm = Get-VM -Name "$VMName" -ErrorAction Stop
}
catch {
    write-host "Unexisting VM : $VMName" -ForegroundColor black -BackgroundColor red
}
# Start Vm
try {
Start-VM -VM $vm -Confirm:$false -ErrorAction Stop
}
catch {
    write-host "
    Failed to start VM : $($vm.Name)" -ForegroundColor black -BackgroundColor red
}