# Stage3_UpdateReplicationConfig.ps1
foreach ($mysourceserver in $mysourceservers) {
    $myreplicationtemplate = Get-MGNReplicationConfiguration -SourceServerID $mysourceserver.sourceserverid
    If ((-not $myreplicationtemplate.AssociateDefaultSecurityGroup) -or ($myreplicationtemplate.ReplicationServersSecurityGroupsIDs -ne $myDefaultMigrationServerSecurityGroup)) {
        Update-MGNReplicationConfiguration -SourceServerID $mysourceserver.sourceserverid -AssociateDefaultSecurityGroup $True -ReplicationServersSecurityGroupsIDs $myDefaultMigrationServerSecurityGroup
    }
}
Write-Host "Replication configuration updated successfully."
