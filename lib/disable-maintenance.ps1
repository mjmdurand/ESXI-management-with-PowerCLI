try {
    set-vmhost -VMHost "$vmHost" -State "Connected" -ErrorAction Stop
}
catch {
    write-host "Failed to disable maintenance mode"
}