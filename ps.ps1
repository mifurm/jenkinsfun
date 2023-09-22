$tenant         = "680a6956-d4bd-4da5-a6f4-ca743607f394"
$ApplicationId  = 'ad94bc49-06c9-4ed7-8554-80163fe9db02'
$pass           = 'PXl8Q~t5eerjaGcB0ja3FVo3PyA7LxmCnjUDZdpg'

$SecurePassword = ConvertTo-SecureString -String $pass -AsPlainText -Force
$Credential     = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $ApplicationId, $SecurePassword

Connect-AzAccount -ServicePrincipal -TenantId $tenant -Credential $Credential
