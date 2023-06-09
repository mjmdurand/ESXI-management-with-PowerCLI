try {
    $detectVersion = Get-View -ViewType HostSystem -Property Name,Config.Product
    write-host 
    "Detected version :  $($detectVersion.Config.Product.FullName)
    For better results, use ESXi-6.7, ESXi-7.0, ESXi-8.0 or 6.7, 7.0, 8.0 ..."
    $updates_filter = Read-Host -Prompt "Current ESXI version "
    write-host "Building update list ..."
    #Next, look to Get-EsxImageProfile
    $argsUpdates = $esxcli.software.sources.profile.list.CreateArgs()
    $argsUpdates.depot = $depot

    $updates = $esxcli.software.sources.profile.list.Invoke($argsUpdates) | where-Object -Property Name -like "*$updates_filter*" -ErrorAction Stop 
    ForEach ($update in $updates) {
        write-host $update.Name
    }
}
catch {
    write-host "Failed to build update list" -ForegroundColor black -BackgroundColor red
}