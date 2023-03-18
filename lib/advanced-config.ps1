#test if cloud-init files exists
if (Test-Path $cloudInitUserdataFile -PathType leaf)
{
    try {
        $cloudInitUserdataContent = Get-Content "$cloudInitUserdataFile" -ErrorAction Stop
    }
    catch {
        write-host "Missing Userdata file : $cloudInitUserdataFile" -ForegroundColor black -BackgroundColor red
    }
}
if (Test-Path $cloudInitMetadataFile -PathType leaf)
{
    try { 
        $cloudInitMetadataContent = Get-Content "$cloudInitMetadataFile" -ErrorAction Stop
    }
    catch {
        write-host "Missing Metadata file : $cloudInitMetadataFile" -ForegroundColor black -BackgroundColor red
    }
}

# guestinfo.metadata
try {
    New-AdvancedSetting -Entity $vm -Name "guestinfo.metadata" -Value "$cloudInitMetadataContent" -Confirm:$false -ErrorAction Stop
}
catch {
    write-host "guestinfo.metadata already exists, updating it instead" -ForegroundColor black -BackgroundColor yellow
    # Update guestinfo.network
    Get-AdvancedSetting -Entity $vm -Name "guestinfo.metadata" | Set-AdvancedSetting -Value "$cloudInitMetadataContent" -Confirm:$false
}
try {
    New-AdvancedSetting -Entity $vm -Name "guestinfo.metadata.encoding" -Value "base64" -Confirm:$false -ErrorAction Stop
}
catch {
    write-host "guestinfo.metadata.encoding already exists, updating it instead" -ForegroundColor black -BackgroundColor yellow
    # Update guestinfo.network
    Get-AdvancedSetting -Entity $vm -Name "guestinfo.metadata.encoding" | Set-AdvancedSetting -Value "base64" -Confirm:$false
}


# guestinfo.userdata
try {
    New-AdvancedSetting -Entity $vm -Name "guestinfo.userdata" -Value "$cloudInitUserdataContent" -Confirm:$false -ErrorAction Stop
}
catch {
    write-host "guestinfo.userdata already exists, updating it instead" -ForegroundColor black -BackgroundColor yellow
    # Update guestinfo.network
    Get-AdvancedSetting -Entity $vm -Name "guestinfo.userdata" | Set-AdvancedSetting -Value "$cloudInitUserdataContent" -Confirm:$false
}
try {
    New-AdvancedSetting -Entity $vm -Name "guestinfo.userdata.encoding" -Value "base64" -Confirm:$false -ErrorAction Stop
}
catch {
    write-host "guestinfo.userdata.encoding already exists, updating it instead" -ForegroundColor black -BackgroundColor yellow
    # Update guestinfo.network
    Get-AdvancedSetting -Entity $vm -Name "guestinfo.userdata.encoding" | Set-AdvancedSetting -Value "base64" -Confirm:$false
}