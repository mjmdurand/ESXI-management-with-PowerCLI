# Connect to esxi
try {
    Connect-VIServer -Server "$serverAddress" -ErrorAction Stop
}
catch {

}