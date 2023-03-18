# guestinfo.metadata
try {
    New-AdvancedSetting -Entity $vm -Name "guestinfo.metadata" -Value "$cloudInitNetworkFile" -Confirm:$false -ErrorAction Stop
}
catch {
    write-host "guestinfo.metadata already exists, updating it instead"
    # Update guestinfo.network
    Get-AdvancedSetting -Entity $vm -Name "guestinfo.metadata" | Set-AdvancedSetting -Value "$cloudInitNetworkFile" -Confirm:$false
}
try {
    New-AdvancedSetting -Entity $vm -Name "guestinfo.metadata.encoding" -Value "base64" -Confirm:$false -ErrorAction Stop
}
catch {
    write-host "guestinfo.metadata.encoding already exists, updating it instead"
    # Update guestinfo.network
    Get-AdvancedSetting -Entity $vm -Name "guestinfo.metadata.encoding" | Set-AdvancedSetting -Value "base64" -Confirm:$false
}


# guestinfo.userdata
try {
    New-AdvancedSetting -Entity $vm -Name "guestinfo.userdata" -Value "$cloudInitUserdataFile" -Confirm:$false -ErrorAction Stop
}
catch {
    write-host "guestinfo.userdata already exists, updating it instead"
    # Update guestinfo.network
    Get-AdvancedSetting -Entity $vm -Name "guestinfo.userdata" | Set-AdvancedSetting -Value "$cloudInitUserdataFile" -Confirm:$false
}
try {
    New-AdvancedSetting -Entity $vm -Name "guestinfo.userdata.encoding" -Value "base64" -Confirm:$false -ErrorAction Stop
}
catch {
    write-host "guestinfo.userdata.encoding already exists, updating it instead"
    # Update guestinfo.network
    Get-AdvancedSetting -Entity $vm -Name "guestinfo.userdata.encoding" | Set-AdvancedSetting -Value "base64" -Confirm:$false
}