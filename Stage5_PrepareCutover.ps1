# Stage5_PrepareCutover.ps1
$mycurrentsourceserver = Get-MGNSourceServer -Filters_SourceServerIDs $mycurrentsourceserver.sourceserverid
Set-MGNServerLifeCycleState -SourceServerID $mycurrentsourceserver.sourceserverid -LifeCycle_State 'READY_FOR_CUTOVER'
Write-Host "Instance prepared for cutover."
