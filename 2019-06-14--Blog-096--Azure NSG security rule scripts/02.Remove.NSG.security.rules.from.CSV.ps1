$NSG = Get-AzNetworkSecurityGroup -Name <NetworkSecurityGroup> -ResourceGroupName <ResourceGroup>
foreach($rule in import-csv "<C:\CSVFILEHERE.csv>"){$NSG | Remove-AzNetworkSecurityRuleConfig -Name $rule.name}
$NSG | Set-AzNetworkSecurityGroup
