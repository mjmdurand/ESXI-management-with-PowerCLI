try {
    $selectedUpdate = Read-Host -Prompt "Please type the update you want to apply"
    $argsInstall = $esxcli.software.profile.update.CreateArgs()
    $argsInstall.depot = $depot
    $argsInstall.profile =$selectedUpdate
    $esxcli.software.profile.update.Invoke($argsInstall)
}
catch {
    write-host "Failed to apply update" -ForegroundColor black -BackgroundColor red
}