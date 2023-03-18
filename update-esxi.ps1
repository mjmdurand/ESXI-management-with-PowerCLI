# Variables
. ./conf/variables.ps1

try {
    $vm = Get-VM -Name "$VMName" -ErrorAction Stop
}
catch {
    write-host "Unexisting VM : $VMName"
}
try {
    $vmHost = Get-VMHost -VM "$vm" -ErrorAction Stop
}
catch {
    write-host "Failed to find VMHost : $vm"
}


# Enable httpClient
try {
    $httpClientFirewallExceptions = Get-VMHostFirewallException -VMHost $vmHost -ErrorAction Stop | where {$_.Name.StartsWith('httpClient')}
    $httpClientFirewallExceptions | Set-VMHostFirewallException -Enabled $true -ErrorAction Stop
}
catch {
    write-host "Failed to enable  httpClient
    $httpClientFirewallExceptions"
}

<#
# stop all VM
$VMList = Get-VM | where-Object -Property PowerState -eq PoweredOn 
ForEach ($ToStop in $VMList) {
    try {
        Stop-VM -VM $vm -Confirm:$false -ErrorAction Stop
    }
    catch {
        write-host "Failed to stop VM : $($ToStop.Name)"
    }


# Enable Maintenance mode
try {
    set-vmhost -VMHost "$vmHost" -ConnectionState Maintenance -ErrorAction Stop
}
catch {
    write-host "Failed to find VMHost : $vm"
}

# Update ESXI
# Search
$esxcli = Get-EsxCli -VMHost (Get-VMHost “$($vmHost.Name)”)
$updates_filter = "ESXi-7.0"
$updates = $esxcli.software.sources.profile.list.Invoke('https://hostupdate.vmware.com/software/VUM/PRODUCTION/main/vmw-depot-index.xml') | where-Object -Property Name -like "*$updates_filter*"
ForEach ($update in $updates) {
        write-host $update.Name
}

$selectedUpdate = Read-Host -Prompt "Please type the update you want "
# Apply
$esxcli.software.profile.update.Invoke("$selectedUpdate")


# Disable httpClient
try {
    $httpClientFirewallExceptions = Get-VMHostFirewallException -VMHost $vmHost -ErrorAction Stop | where {$_.Name.StartsWith('httpClient')}
    $httpClientFirewallExceptions | Set-VMHostFirewallException -Enabled $false -ErrorAction Stop
}
catch {
    write-host "Failed to enable  httpClient
    $httpClientFirewallExceptions"
}


# Disable Maintenance mode
try {
    set-vmhost -VMHost "$vmHost" -ConnectionState Connected -ErrorAction Stop
}
catch {
    write-host "Failed to find VMHost : $vm"
}


# start all VM
$VMList = Get-VM | where-Object -Property PowerState -eq PoweredOff 
ForEach ($ToStop in $VMList) {
    try {
        Start-VM -VM $vm -Confirm:$false -ErrorAction Stop
    }
    catch {
        write-host "Failed to start VM : $($ToStop.Name)"
    }
}

#>



<#
    $datastorename = "mgt-ds01"
    $clustername = "Management"
    $hosts = get-cluster $ClusterName | get-vmhost
    $hosts | get-vm | stop-vm -confirm:$false
    $hosts | set-vmhost -state "maintenance" -confirm:$false
    $hosts | Install-VMHostPatch -HostPath /vmfs/volumes/$datastorename/60u2/metadata.zip
    $hosts | restart-vmhost -force -confirm:$false
    $hosts | set-vmhost -state "Connected" -confirm:$false
    $hosts | get-vm | start-vm


#>