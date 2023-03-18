
try {
    $httpClientFirewallExceptions = Get-VMHostFirewallException -VMHost $vmHost -ErrorAction Stop | where {$_.Name.StartsWith('httpClient')}
    $httpClientFirewallExceptions | Set-VMHostFirewallException -Enabled $true -ErrorAction Stop
}
catch {
    write-host "Failed to enable  httpClient
    $httpClientFirewallExceptions"
}