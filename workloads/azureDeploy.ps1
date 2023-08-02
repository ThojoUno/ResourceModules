



$Location = 'eastus'

#LunaviLab
$TenantId = '0c557776-7f20-4c23-8c8e-53bebcc62ae6'
# PROD-STATIC
$subscriptionId = '0866a0af-9a63-42a4-b5e6-b2b5371a8965'

$subId = '0397f14b-7a87-4673-a605-037288623760'

Connect-AzAccount -TenantId $tenantId
Set-AzContext -Subscription $subscriptionId
Get-AzContext

Set-AzContext -Subscription $subId


Get-AzContainerRegistry -ResourceGroupName 'artifacts-rg' -Name 'acrcuslunavibr001' | Select-Object LoginServer

. .\utilities\pipelines\resourcePublish\Publish-ModuleToPrivateBicepRegistry.ps1

Publish-ModuleToPrivateBicepRegistry -TemplateFilePath '.\modules\key-vault\vaults\main.bicep' `
    -ModuleVersion '0.5' -BicepRegistryName 'acrcuslunavibr001' -BicepRegistryRgName 'artifacts-rg' `
    -BicepRegistryRgLocation 'Central US' -Verbose


$modules = Get-ChildItem -Path '<pathToModulesFolder>' -Recurse -Filter 'main.bicep'

$modules.FullName | ForEach-Object -Parallel {
    . '.\utilities\pipelines\resourcePublish\Publish-ModuleToPrivateBicepRegistry.ps1'
    Publish-ModuleToPrivateBicepRegistry -TemplateFilePath $_ -ModuleVersion '1.0' -BicepRegistryName 'acrcuslunavibr001' -BicepRegistryRgName 'artifacts-rg'
} -ThrottleLimit 4




New-AzResourceGroupDeployment -ResourceGroupName 'rg-westus2-mgmt-lab-hub' `
    -TemplateFile modules/desktop-virtualization/host-pools/main.bicep `
    -nameFromTemplate 'vdpool-test'

. ./utilities/tools/Set-ModuleReadMe.ps1
Set-ModuleReadMe -TemplateFilePath 'C:\Users\JoeThompson\OneDrive - Lunavi\Github\ResourceModules\modules\desktop-virtualization\host-pools\main.bicep' -Verbose

. ./utilities/tools/ConvertTo-ARMTemplate.ps1
ConvertTo-ARMTemplate -TemplateFile 'C:\Users\JoeThompson\OneDrive - Lunavi\Github\ResourceModules\modules\desktop-virtualization\host-pools\main.bicep'
