# Stage6_TagResources.ps1
$basetags = @()
$tag = [Amazon.EC2.Model.Tag]'siemens:project:upmx'; $tag.Value = 'APM0028819'; $basetags += $tag
$tag = [Amazon.EC2.Model.Tag]'siemens:project:acp'; $tag.Value = '2-2-2'; $basetags += $tag
$tag = [Amazon.EC2.Model.Tag]'siemens:project:environment'; $tag.Value = $tag_env; $basetags += $tag
$tag = [Amazon.EC2.Model.Tag]'siemens:project:name'; $tag.Value = $myProject; $basetags += $tag
$tag = [Amazon.EC2.Model.Tag]'Name'; $tag.Value = $myInstanceName; $basetags += $tag

$myresourceids = @()
$myinstance = (Get-EC2Instance -InstanceID $myinstance.instanceid).Instances
$myresourceids += $myinstance.instanceid
$myresourceids += $myinstance.blockdevicemappings.ebs.volumeid
$myresourceids += $myinstance.networkinterfaces.networkinterfaceid

New-EC2Tag -tag $basetags -ResourceId $myresourceids
Write-Host "Resources tagged successfully."
