try {
    $selectedUpdate = Read-Host -Prompt "Please type the update you want to apply "
    $esxcli.software.profile.update.Invoke("$selectedUpdate")
}
catch {
    write-host "Failed to apply update" -ForegroundColor black -BackgroundColor red
}