# Install Powercli
try {
    Install-Module VMware.PowerCLI -AllowClobber -Force #-ErrorAction Stop
}
catch {
    write-host "Failed to install powershell PowerCLI module" -ForegroundColor black -BackgroundColor red
}

<#
# Disable CEIP
try {
    Set-PowerCLIConfiguration -ParticipateInCeip -Confirm:$false -ErrorAction Stop
}
catch {
    write-host "Failed to disable CEIP"
}
#>

# Disable ssl cert check
try {
    Set-PowerCLIConfiguration -InvalidCertificateAction ignore -Confirm:$false -ErrorAction Stop
}
catch {
    write-host "Failed to disable ssl cert check" -ForegroundColor black -BackgroundColor red
}