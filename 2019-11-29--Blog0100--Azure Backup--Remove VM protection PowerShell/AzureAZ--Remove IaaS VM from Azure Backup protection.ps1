$vault = Get-AzRecoveryServicesVault -ResourceGroupName "[Resource group name here]" -Name "[Recovery Services Vault name here]"
$Container = Get-AzRecoveryServicesBackupContainer -ContainerType AzureVM -Status Registered -FriendlyName [VM name here] -VaultId $vault.ID
$BackupItem = Get-AzRecoveryServicesBackupItem -Container $Container -WorkloadType AzureVM -VaultId $vault.ID

Disable-AzRecoveryServicesBackupProtection -Item $BackupItem -VaultId $vault.ID -RemoveRecoveryPoints -Force

# "-RemoveRecoveryPoints" is required to be able to completely remove the VM from the RSV, otherwise a soft delete window of 14 days is appplied.
# "-Force" is optional. If you don't include this, you will be prompted YES/NO to continue.