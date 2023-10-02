#Import-Module -Name Az
#pwsh -command '$PSVersionTable.PSVersion.Major'

$sub            = "ce5686a3-a664-455d-86cd-0c3518d6920c"
$vaultName      = "vault-lmtlmpup"
$storageAcc     = "fssg01"
$bckpItem       = "fs01"
$clientId       = '00ad99b4-38cd-43fd-b26a-384d63e92a08'


Connect-AzAccount -Identity

Connect-AzAccount -Identity -AccountId $clientId

Select-AzSubscription -Subscription $sub

$azr=Get-AzRecoveryServicesVault -Name $vaultName

Set-AzRecoveryServicesVaultContext -Vault $azr

$afsContainer = Get-AzRecoveryServicesBackupContainer -FriendlyName $storageAcc -ContainerType AzureStorage
$afsBkpItem   = Get-AzRecoveryServicesBackupItem -Container $afsContainer -WorkloadType "AzureFiles" -FriendlyName $bckpItem
$job          = Backup-AzRecoveryServicesBackupItem -Item $afsBkpItem

#az cli version
#az backup protection backup-now --item-name "bckpfssmb" --resource-group "backuprg" --vault-name "vault-ln7u8gmk" --container-name st01bckp --backup-management-type AzureStorage --workload-type AzureFileShare
#https://learn.microsoft.com/en-us/cli/azure/backup/vault?view=azure-cli-latest#az-backup-vault-list()
#https://github.com/Azure/azure-cli/issues/11179
