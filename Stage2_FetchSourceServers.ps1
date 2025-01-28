# Stage2_FetchSourceServers.ps1
$myallmgnservers = @()
$myallmgnserverspage = Get-MGNSourceServer -select * 
$myallmgnservers += $myallmgnserverspage.items
Write-Host "Fetched $($myallmgnservers.count) records so far"
while ($myallmgnserverspage.nexttoken) {
    $myallmgnserverspage = Get-MGNSourceServer -select * -NextToken $myallmgnserverspage.nexttoken
    $myallmgnservers += $myallmgnserverspage.items
    Write-Host "Fetched $($myallmgnservers.count) records so far"
}
Write-Host "Finished. Fetched total of $($myallmgnservers.count) records."

$global:mysourceservers = $myallmgnservers | Where-Object {$_.SourceProperties.identificationhints.vmpath -like $myOnPremPath}
Write-Host "Source servers fetched successfully."
