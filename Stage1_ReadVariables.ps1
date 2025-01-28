# Stage1_ReadVariables.ps1
$csvPath = "./variables.csv"
$variables = Import-Csv -Path $csvPath

foreach ($var in $variables) {
    $global:myInstanceName = $var.InstanceName
    $global:myInstanceType = $var.InstanceType
    $global:myOnPremPath = $var.OnPremPath
    $global:myEBSKMSKeyID = $var.EBSKMSKeyID
    $global:myIAMRoleARN = $var.IAMRoleARN
    $global:tag_env = $var.TagEnv
    $global:myProject = $var.Project
    $global:RACIDR = $var.RACIDR
    $global:RAGW = $RACIDR.Substring(0, $RACIDR.Length-1) + "1"
    $global:myIPConfigRA = [PSCustomObject]@{
        mySubnetSegment = $var.IPConfigRA_Subnet
        myIP = $var.IPConfigRA_IP
    }
    $global:myIPConfig1 = [PSCustomObject]@{
        mySubnetSegment = $var.IPConfig1_Subnet
        myIP = $var.IPConfig1_IP
    }
    $global:myIPConfig2 = [PSCustomObject]@{
        mySubnetSegment = $var.IPConfig2_Subnet
        myIP = $var.IPConfig2_IP
    }
    $global:myIPConfig3 = [PSCustomObject]@{
        mySubnetSegment = $var.IPConfig3_Subnet
        myIP = $var.IPConfig3_IP
    }
}

Write-Host "Variables loaded successfully."
