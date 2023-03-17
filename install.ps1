# Install Powercli
try {
    Install-Module VMware.PowerCLI -Scope CurrentUser -Confirm:$false -ErrorAction Stop
}
catch {
    write-host "Failed to install powershell PowerCLI module"
}
# Disable ssl cert check
try {
    Set-PowerCLIConfiguration -Scope User -InvalidCertificateAction warn -Confirm:$false -ErrorAction Stop
}
catch {
    write-host "Failed to disable ssl cert check"
}