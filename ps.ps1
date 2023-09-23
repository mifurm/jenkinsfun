#Import-Module -Name Az
$sub            = "ce5686a3-a664-455d-86cd-0c3518d6920c"
$vaultName      = "vault-lmtlmpup"
$storageAcc     = "fssg01"
$bckpItem       = "fs01"


Connect-AzAccount -Identity

Select-AzSubscription -Subscription $sub

$azr=Get-AzRecoveryServicesVault -Name $vaultName

Set-AzRecoveryServicesVaultContext -Vault $azr

$afsContainer = Get-AzRecoveryServicesBackupContainer -FriendlyName $storageAcc -ContainerType AzureStorage
$afsBkpItem   = Get-AzRecoveryServicesBackupItem -Container $afsContainer -WorkloadType "AzureFiles" -FriendlyName $bckpItem
$job          = Backup-AzRecoveryServicesBackupItem -Item $afsBkpItem
