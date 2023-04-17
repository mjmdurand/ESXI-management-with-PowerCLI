try {
    $esxcli = Get-EsxCli -VMHost $vmHost.Name -V2 -ErrorAction Stop
}
catch {
    write-host "Failed create get-esxi file" -ForegroundColor black -BackgroundColor red
}