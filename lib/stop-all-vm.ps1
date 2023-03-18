$VMList = Get-VM | where-Object -Property PowerState -eq PoweredOn 
ForEach ($ToStop in $VMList) {
    try {
        Stop-VM -VM $ToStop -Confirm:$false -ErrorAction Stop
    }
    catch {
        write-host "Failed to stop VM : $($ToStop.Name)"
    }
}
