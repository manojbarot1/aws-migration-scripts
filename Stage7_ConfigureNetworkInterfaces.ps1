# Stage7_ConfigureNetworkInterfaces.ps1
$myinstance = (Get-EC2Instance -InstanceID $myinstance.instanceid).Instances
$myNICs = $myInstance.networkinterfaces | Where-Object {-not ($_.privateipaddress -like $RACIDR)}
$myNICs.attachment.attachmentid | ForEach-Object {Dismount-EC2NetworkInterface -AttachmentId $_; Start-Sleep 2} 
Start-Sleep 10

Foreach ($mynic in $mynics) {
    $myinstance = (Get-EC2Instance -InstanceID $myinstance.instanceid).Instances
    $mydeviceindex = $myInstance.NetworkInterfaces.attachment.deviceindex | Measure-Object -Maximum | Select-Object -ExpandProperty Maximum
    $mydeviceindex = [int]$mydeviceindex + 1
    Add-EC2NetworkInterface -NetworkInterfaceId $mynic.networkinterfaceid -InstanceId $myInstance.instanceid -DeviceIndex $mydeviceindex
    Start-Sleep 3
}
Write-Host "Network interfaces configured successfully."
