try {
    $esxcli = Get-EsxCli -VMHost $vmHost.Name -ErrorAction Stop
}
catch {
    write-host "Failed create get-esxi file" -ForegroundColor black -BackgroundColor red
}