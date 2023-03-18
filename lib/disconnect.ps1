# Disconnect
try {
    Disconnect-VIServer -Confirm:$false -ErrorAction Stop
}
catch {
    write-host "Failed to disconnect from remote" -ForegroundColor black -BackgroundColor red
}