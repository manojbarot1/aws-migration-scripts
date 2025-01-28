# Stage9_PerformCutover.ps1

# Ensure the source server is ready for cutover
$mycurrentsourceserver = Get-MGNSourceServer -Filters_SourceServerIDs $mycurrentsourceserver.sourceserverid
if ($mycurrentsourceserver.lifecycle.state -ne 'READY_FOR_CUTOVER') {
    Write-Host "Instance is not ready for cutover. Current state: $($mycurrentsourceserver.lifecycle.state)"
    exit 1
}

# Initiate cutover
Write-Host "Initiating cutover for instance: $myInstanceName"
Start-MGNCutover -SourceServerID $mycurrentsourceserver.sourceserverid

# Monitor cutover status
Write-Host "Waiting for cutover to complete..."
do {
    Start-Sleep -Seconds 30
    $mycurrentsourceserver = Get-MGNSourceServer -Filters_SourceServerIDs $mycurrentsourceserver.sourceserverid
    Write-Host "Current cutover state: $($mycurrentsourceserver.lifecycle.state)"
} while ($mycurrentsourceserver.lifecycle.state -eq 'CUTTING_OVER')

# Check final state
if ($mycurrentsourceserver.lifecycle.state -eq 'CUTOVER_COMPLETE') {
    Write-Host "Cutover completed successfully for instance: $myInstanceName"
} else {
    Write-Host "Cutover failed. Current state: $($mycurrentsourceserver.lifecycle.state)"
    exit 1
}
