# Connect to esxi
try {
    Connect-VIServer -Server "$serverAddress" -ErrorAction Stop
}
catch {
    write-host "Failed to connect to the remote host" -ForegroundColor black -BackgroundColor red
}