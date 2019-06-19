$NSG = Get-AzNetworkSecurityGroup -Name <NetworkSecurityGroup> -ResourceGroupName <ResourceGroup> 
foreach($rule in import-csv "<C:\CSVFILEHERE.csv>"){ 
$NSG | Add-AzNetworkSecurityRuleConfig `
-Name $rule.name `
-Description $rule.Description `
-Priority $rule.Priority `
-Protocol $rule.Protocol `
-Access $rule.Access `
-Direction $rule.Direction `
-SourceAddressPrefix ($rule.SourceAddressPrefix -split ',') `
-SourcePortRange ($rule.SourcePortRange -split ',') `
-DestinationAddressPrefix ($rule.DestinationAddressPrefix -split ',') `
-DestinationPortRange ($rule.DestinationPortRange -split ',')
}
$NSG | Set-AzNetworkSecurityGroup
