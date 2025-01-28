# Stage4_UpdateLaunchTemplate.ps1
$mycurrentsourceserver = $mysourceservers | Where-Object {$_.tags.values -eq $myInstanceName}
$mycurrentlaunchconfiguration = Get-MGNLaunchConfiguration -SourceServerID $mycurrentsourceserver.SourceServerID
$mycurrentlaunchtemplate = Get-EC2LaunchTemplate -LaunchTemplateId $mycurrentlaunchconfiguration.Ec2LaunchTemplateID
$mycurrentlaunchtemplateversion = Get-EC2LaunchTemplateVersion -Version $mycurrentlaunchtemplate.DefaultVersionNumber -LaunchTemplateId $mycurrentlaunchconfiguration.Ec2LaunchTemplateID

# Create new launch template version
$mynewrequesttemplatedata = New-Object -TypeName Amazon.EC2.Model.RequestLaunchTemplateData
# ... (add block device mappings, IAM role, instance type, and network interfaces as in the original script)

$mynewtemplateversion = New-EC2LaunchTemplateVersion -LaunchTemplateId $mycurrentlaunchtemplate.launchtemplateid -VersionDescription $myInstanceName -SourceVersion $mycurrentlaunchtemplate.DefaultVersionNumber -LaunchTemplateData $mynewrequesttemplatedata
Edit-EC2LaunchTemplate -LaunchTemplateId $mycurrentlaunchtemplate.launchtemplateid -DefaultVersion $mynewtemplateversion.VersionNumber

Write-Host "Launch template updated successfully."
