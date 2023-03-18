try {
    set-vmhost -VMHost "$vmHost" -State "Maintenance" -ErrorAction Stop
}
catch {
    write-host "Failed to enable maintenance mode"
}