$VMList = Get-VM | where-Object -Property PowerState -eq PoweredOff 
ForEach ($ToStart in $VMList) {
    try {
        Start-VM -VM $ToStart -Confirm:$false -ErrorAction Stop
    }
    catch {
        write-host "Failed to start VM : $($ToStart.Name)"
    }
}