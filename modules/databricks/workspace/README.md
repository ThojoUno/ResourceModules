# Azure Databricks Workspaces `[Microsoft.Databricks/workspaces]`

This module deploys an Azure Databricks Workspace.

## Navigation

- [Resource Types](#Resource-Types)
- [Usage examples](#Usage-examples)
- [Parameters](#Parameters)
- [Outputs](#Outputs)
- [Cross-referenced modules](#Cross-referenced-modules)
- [Notes](#Notes)

## Resource Types

| Resource Type | API Version |
| :-- | :-- |
| `Microsoft.Authorization/locks` | [2020-05-01](https://learn.microsoft.com/en-us/azure/templates/Microsoft.Authorization/2020-05-01/locks) |
| `Microsoft.Authorization/roleAssignments` | [2022-04-01](https://learn.microsoft.com/en-us/azure/templates/Microsoft.Authorization/2022-04-01/roleAssignments) |
| `Microsoft.Databricks/workspaces` | [2023-02-01](https://learn.microsoft.com/en-us/azure/templates/Microsoft.Databricks/2023-02-01/workspaces) |
| `Microsoft.Insights/diagnosticSettings` | [2021-05-01-preview](https://learn.microsoft.com/en-us/azure/templates/Microsoft.Insights/2021-05-01-preview/diagnosticSettings) |
| `Microsoft.Network/privateEndpoints` | [2023-04-01](https://learn.microsoft.com/en-us/azure/templates/Microsoft.Network/2023-04-01/privateEndpoints) |
| `Microsoft.Network/privateEndpoints/privateDnsZoneGroups` | [2023-04-01](https://learn.microsoft.com/en-us/azure/templates/Microsoft.Network/2023-04-01/privateEndpoints/privateDnsZoneGroups) |

## Usage examples

The following section provides usage examples for the module, which were used to validate and deploy the module successfully. For a full reference, please review the module's test folder in its repository.

>**Note**: Each example lists all the required parameters first, followed by the rest - each in alphabetical order.

>**Note**: To reference the module, please use the following syntax `br:bicep/modules/databricks.workspace:1.0.0`.

- [Using only defaults](#example-1-using-only-defaults)
- [Using large parameter set](#example-2-using-large-parameter-set)

### Example 1: _Using only defaults_

This instance deploys the module with the minimum set of required parameters.


<details>

<summary>via Bicep module</summary>

```bicep
module workspace 'br:bicep/modules/databricks.workspace:1.0.0' = {
  name: '${uniqueString(deployment().name, location)}-test-dwmin'
  params: {
    // Required parameters
    name: 'dwmin001'
    // Non-required parameters
    enableDefaultTelemetry: '<enableDefaultTelemetry>'
  }
}
```

</details>
<p>

<details>

<summary>via JSON Parameter file</summary>

```json
{
  "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentParameters.json#",
  "contentVersion": "1.0.0.0",
  "parameters": {
    // Required parameters
    "name": {
      "value": "dwmin001"
    },
    // Non-required parameters
    "enableDefaultTelemetry": {
      "value": "<enableDefaultTelemetry>"
    }
  }
}
```

</details>
<p>

### Example 2: _Using large parameter set_

This instance deploys the module with most of its features enabled.


<details>

<summary>via Bicep module</summary>

```bicep
module workspace 'br:bicep/modules/databricks.workspace:1.0.0' = {
  name: '${uniqueString(deployment().name, location)}-test-dwmax'
  params: {
    // Required parameters
    name: 'dwmax001'
    // Non-required parameters
    amlWorkspaceResourceId: '<amlWorkspaceResourceId>'
    customerManagedKey: {
      keyName: '<keyName>'
      keyVaultResourceId: '<keyVaultResourceId>'
    }
    customerManagedKeyManagedDisk: {
      keyName: '<keyName>'
      keyVaultResourceId: '<keyVaultResourceId>'
      rotationToLatestKeyVersionEnabled: true
    }
    customPrivateSubnetName: '<customPrivateSubnetName>'
    customPublicSubnetName: '<customPublicSubnetName>'
    customVirtualNetworkResourceId: '<customVirtualNetworkResourceId>'
    diagnosticSettings: [
      {
        eventHubAuthorizationRuleResourceId: '<eventHubAuthorizationRuleResourceId>'
        eventHubName: '<eventHubName>'
        logCategoriesAndGroups: [
          {
            category: 'jobs'
          }
          {
            category: 'notebook'
          }
        ]
        name: 'customSetting'
        storageAccountResourceId: '<storageAccountResourceId>'
        workspaceResourceId: '<workspaceResourceId>'
      }
    ]
    disablePublicIp: true
    enableDefaultTelemetry: '<enableDefaultTelemetry>'
    loadBalancerBackendPoolName: '<loadBalancerBackendPoolName>'
    loadBalancerResourceId: '<loadBalancerResourceId>'
    location: '<location>'
    lock: {
      kind: 'CanNotDelete'
      name: 'myCustomLockName'
    }
    managedResourceGroupResourceId: '<managedResourceGroupResourceId>'
    natGatewayName: 'nat-gateway'
    prepareEncryption: true
    privateEndpoints: [
      {
        privateDnsZoneResourceIds: [
          '<privateDNSZoneResourceId>'
        ]
        subnetResourceId: '<subnetResourceId>'
        tags: {
          Environment: 'Non-Prod'
          Role: 'DeploymentValidation'
        }
      }
    ]
    publicIpName: 'nat-gw-public-ip'
    publicNetworkAccess: 'Disabled'
    requiredNsgRules: 'NoAzureDatabricksRules'
    requireInfrastructureEncryption: true
    roleAssignments: [
      {
        principalId: '<principalId>'
        principalType: 'ServicePrincipal'
        roleDefinitionIdOrName: 'Reader'
      }
    ]
    skuName: 'premium'
    storageAccountName: 'sadwmax001'
    storageAccountSkuName: 'Standard_ZRS'
    tags: {
      Environment: 'Non-Prod'
      'hidden-title': 'This is visible in the resource name'
      Role: 'DeploymentValidation'
    }
    vnetAddressPrefix: '10.100'
  }
}
```

</details>
<p>

<details>

<summary>via JSON Parameter file</summary>

```json
{
  "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentParameters.json#",
  "contentVersion": "1.0.0.0",
  "parameters": {
    // Required parameters
    "name": {
      "value": "dwmax001"
    },
    // Non-required parameters
    "amlWorkspaceResourceId": {
      "value": "<amlWorkspaceResourceId>"
    },
    "customerManagedKey": {
      "value": {
        "keyName": "<keyName>",
        "keyVaultResourceId": "<keyVaultResourceId>"
      }
    },
    "customerManagedKeyManagedDisk": {
      "value": {
        "keyName": "<keyName>",
        "keyVaultResourceId": "<keyVaultResourceId>",
        "rotationToLatestKeyVersionEnabled": true
      }
    },
    "customPrivateSubnetName": {
      "value": "<customPrivateSubnetName>"
    },
    "customPublicSubnetName": {
      "value": "<customPublicSubnetName>"
    },
    "customVirtualNetworkResourceId": {
      "value": "<customVirtualNetworkResourceId>"
    },
    "diagnosticSettings": {
      "value": [
        {
          "eventHubAuthorizationRuleResourceId": "<eventHubAuthorizationRuleResourceId>",
          "eventHubName": "<eventHubName>",
          "logCategoriesAndGroups": [
            {
              "category": "jobs"
            },
            {
              "category": "notebook"
            }
          ],
          "name": "customSetting",
          "storageAccountResourceId": "<storageAccountResourceId>",
          "workspaceResourceId": "<workspaceResourceId>"
        }
      ]
    },
    "disablePublicIp": {
      "value": true
    },
    "enableDefaultTelemetry": {
      "value": "<enableDefaultTelemetry>"
    },
    "loadBalancerBackendPoolName": {
      "value": "<loadBalancerBackendPoolName>"
    },
    "loadBalancerResourceId": {
      "value": "<loadBalancerResourceId>"
    },
    "location": {
      "value": "<location>"
    },
    "lock": {
      "value": {
        "kind": "CanNotDelete",
        "name": "myCustomLockName"
      }
    },
    "managedResourceGroupResourceId": {
      "value": "<managedResourceGroupResourceId>"
    },
    "natGatewayName": {
      "value": "nat-gateway"
    },
    "prepareEncryption": {
      "value": true
    },
    "privateEndpoints": {
      "value": [
        {
          "privateDnsZoneResourceIds": [
            "<privateDNSZoneResourceId>"
          ],
          "subnetResourceId": "<subnetResourceId>",
          "tags": {
            "Environment": "Non-Prod",
            "Role": "DeploymentValidation"
          }
        }
      ]
    },
    "publicIpName": {
      "value": "nat-gw-public-ip"
    },
    "publicNetworkAccess": {
      "value": "Disabled"
    },
    "requiredNsgRules": {
      "value": "NoAzureDatabricksRules"
    },
    "requireInfrastructureEncryption": {
      "value": true
    },
    "roleAssignments": {
      "value": [
        {
          "principalId": "<principalId>",
          "principalType": "ServicePrincipal",
          "roleDefinitionIdOrName": "Reader"
        }
      ]
    },
    "skuName": {
      "value": "premium"
    },
    "storageAccountName": {
      "value": "sadwmax001"
    },
    "storageAccountSkuName": {
      "value": "Standard_ZRS"
    },
    "tags": {
      "value": {
        "Environment": "Non-Prod",
        "hidden-title": "This is visible in the resource name",
        "Role": "DeploymentValidation"
      }
    },
    "vnetAddressPrefix": {
      "value": "10.100"
    }
  }
}
```

</details>
<p>


## Parameters

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`name`](#parameter-name) | string | The name of the Azure Databricks workspace to create. |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`amlWorkspaceResourceId`](#parameter-amlworkspaceresourceid) | string | The resource ID of a Azure Machine Learning workspace to link with Databricks workspace. |
| [`customerManagedKey`](#parameter-customermanagedkey) | object | The customer managed key definition to use for the managed service. |
| [`customerManagedKeyManagedDisk`](#parameter-customermanagedkeymanageddisk) | object | The customer managed key definition to use for the managed disk. |
| [`customPrivateSubnetName`](#parameter-customprivatesubnetname) | string | The name of the Private Subnet within the Virtual Network. |
| [`customPublicSubnetName`](#parameter-custompublicsubnetname) | string | The name of a Public Subnet within the Virtual Network. |
| [`customVirtualNetworkResourceId`](#parameter-customvirtualnetworkresourceid) | string | The resource ID of a Virtual Network where this Databricks Cluster should be created. |
| [`diagnosticSettings`](#parameter-diagnosticsettings) | array | The diagnostic settings of the service. |
| [`disablePublicIp`](#parameter-disablepublicip) | bool | Disable Public IP. |
| [`enableDefaultTelemetry`](#parameter-enabledefaulttelemetry) | bool | Enable telemetry via a Globally Unique Identifier (GUID). |
| [`loadBalancerBackendPoolName`](#parameter-loadbalancerbackendpoolname) | string | Name of the outbound Load Balancer Backend Pool for Secure Cluster Connectivity (No Public IP). |
| [`loadBalancerResourceId`](#parameter-loadbalancerresourceid) | string | Resource URI of Outbound Load balancer for Secure Cluster Connectivity (No Public IP) workspace. |
| [`location`](#parameter-location) | string | Location for all Resources. |
| [`lock`](#parameter-lock) | object | The lock settings of the service. |
| [`managedResourceGroupResourceId`](#parameter-managedresourcegroupresourceid) | string | The managed resource group ID. It is created by the module as per the to-be resource ID you provide. |
| [`natGatewayName`](#parameter-natgatewayname) | string | Name of the NAT gateway for Secure Cluster Connectivity (No Public IP) workspace subnets. |
| [`prepareEncryption`](#parameter-prepareencryption) | bool | Prepare the workspace for encryption. Enables the Managed Identity for managed storage account. |
| [`privateEndpoints`](#parameter-privateendpoints) | array | Configuration details for private endpoints. For security reasons, it is recommended to use private endpoints whenever possible. |
| [`publicIpName`](#parameter-publicipname) | string | Name of the Public IP for No Public IP workspace with managed vNet. |
| [`publicNetworkAccess`](#parameter-publicnetworkaccess) | string | 	The network access type for accessing workspace. Set value to disabled to access workspace only via private link. |
| [`requiredNsgRules`](#parameter-requirednsgrules) | string | Gets or sets a value indicating whether data plane (clusters) to control plane communication happen over private endpoint. |
| [`requireInfrastructureEncryption`](#parameter-requireinfrastructureencryption) | bool | A boolean indicating whether or not the DBFS root file system will be enabled with secondary layer of encryption with platform managed keys for data at rest. |
| [`roleAssignments`](#parameter-roleassignments) | array | Array of role assignment objects that contain the 'roleDefinitionIdOrName' and 'principalId' to define RBAC role assignments on this resource. In the roleDefinitionIdOrName attribute, you can provide either the display name of the role definition, or its fully qualified ID in the following format: '/providers/Microsoft.Authorization/roleDefinitions/c2f4ef07-c644-48eb-af81-4b1b4947fb11'. |
| [`skuName`](#parameter-skuname) | string | The pricing tier of workspace. |
| [`storageAccountName`](#parameter-storageaccountname) | string | Default DBFS storage account name. |
| [`storageAccountSkuName`](#parameter-storageaccountskuname) | string | Storage account SKU name. |
| [`tags`](#parameter-tags) | object | Tags of the resource. |
| [`vnetAddressPrefix`](#parameter-vnetaddressprefix) | string | Address prefix for Managed virtual network. |

### Parameter: `amlWorkspaceResourceId`

The resource ID of a Azure Machine Learning workspace to link with Databricks workspace.
- Required: No
- Type: string
- Default: `''`

### Parameter: `customerManagedKey`

The customer managed key definition to use for the managed service.
- Required: No
- Type: object


| Name | Required | Type | Description |
| :-- | :-- | :--| :-- |
| [`keyName`](#parameter-customermanagedkeykeyname) | Yes | string | Required. The name of the customer managed key to use for encryption. |
| [`keyVaultResourceId`](#parameter-customermanagedkeykeyvaultresourceid) | Yes | string | Required. The resource ID of a key vault to reference a customer managed key for encryption from. |
| [`keyVersion`](#parameter-customermanagedkeykeyversion) | No | string | Optional. The version of the customer managed key to reference for encryption. If not provided, using 'latest'. |
| [`userAssignedIdentityResourceId`](#parameter-customermanagedkeyuserassignedidentityresourceid) | No | string | Optional. User assigned identity to use when fetching the customer managed key. Required if no system assigned identity is available for use. |

### Parameter: `customerManagedKey.keyName`

Required. The name of the customer managed key to use for encryption.

- Required: Yes
- Type: string

### Parameter: `customerManagedKey.keyVaultResourceId`

Required. The resource ID of a key vault to reference a customer managed key for encryption from.

- Required: Yes
- Type: string

### Parameter: `customerManagedKey.keyVersion`

Optional. The version of the customer managed key to reference for encryption. If not provided, using 'latest'.

- Required: No
- Type: string

### Parameter: `customerManagedKey.userAssignedIdentityResourceId`

Optional. User assigned identity to use when fetching the customer managed key. Required if no system assigned identity is available for use.

- Required: No
- Type: string

### Parameter: `customerManagedKeyManagedDisk`

The customer managed key definition to use for the managed disk.
- Required: No
- Type: object


| Name | Required | Type | Description |
| :-- | :-- | :--| :-- |
| [`keyName`](#parameter-customermanagedkeymanageddiskkeyname) | Yes | string | Required. The name of the customer managed key to use for encryption. |
| [`keyVaultResourceId`](#parameter-customermanagedkeymanageddiskkeyvaultresourceid) | Yes | string | Required. The resource ID of a key vault to reference a customer managed key for encryption from. |
| [`keyVersion`](#parameter-customermanagedkeymanageddiskkeyversion) | No | string | Optional. The version of the customer managed key to reference for encryption. If not provided, using 'latest'. |
| [`rotationToLatestKeyVersionEnabled`](#parameter-customermanagedkeymanageddiskrotationtolatestkeyversionenabled) | No | bool | Optional. Indicate whether the latest key version should be automatically used for Managed Disk Encryption. Enabled by default. |
| [`userAssignedIdentityResourceId`](#parameter-customermanagedkeymanageddiskuserassignedidentityresourceid) | No | string | Optional. User assigned identity to use when fetching the customer managed key. Required if no system assigned identity is available for use. |

### Parameter: `customerManagedKeyManagedDisk.keyName`

Required. The name of the customer managed key to use for encryption.

- Required: Yes
- Type: string

### Parameter: `customerManagedKeyManagedDisk.keyVaultResourceId`

Required. The resource ID of a key vault to reference a customer managed key for encryption from.

- Required: Yes
- Type: string

### Parameter: `customerManagedKeyManagedDisk.keyVersion`

Optional. The version of the customer managed key to reference for encryption. If not provided, using 'latest'.

- Required: No
- Type: string

### Parameter: `customerManagedKeyManagedDisk.rotationToLatestKeyVersionEnabled`

Optional. Indicate whether the latest key version should be automatically used for Managed Disk Encryption. Enabled by default.

- Required: No
- Type: bool

### Parameter: `customerManagedKeyManagedDisk.userAssignedIdentityResourceId`

Optional. User assigned identity to use when fetching the customer managed key. Required if no system assigned identity is available for use.

- Required: No
- Type: string

### Parameter: `customPrivateSubnetName`

The name of the Private Subnet within the Virtual Network.
- Required: No
- Type: string
- Default: `''`

### Parameter: `customPublicSubnetName`

The name of a Public Subnet within the Virtual Network.
- Required: No
- Type: string
- Default: `''`

### Parameter: `customVirtualNetworkResourceId`

The resource ID of a Virtual Network where this Databricks Cluster should be created.
- Required: No
- Type: string
- Default: `''`

### Parameter: `diagnosticSettings`

The diagnostic settings of the service.
- Required: No
- Type: array


| Name | Required | Type | Description |
| :-- | :-- | :--| :-- |
| [`eventHubAuthorizationRuleResourceId`](#parameter-diagnosticsettingseventhubauthorizationruleresourceid) | No | string | Optional. Resource ID of the diagnostic event hub authorization rule for the Event Hubs namespace in which the event hub should be created or streamed to. |
| [`eventHubName`](#parameter-diagnosticsettingseventhubname) | No | string | Optional. Name of the diagnostic event hub within the namespace to which logs are streamed. Without this, an event hub is created for each log category. For security reasons, it is recommended to set diagnostic settings to send data to either storage account, log analytics workspace or event hub. |
| [`logAnalyticsDestinationType`](#parameter-diagnosticsettingsloganalyticsdestinationtype) | No | string | Optional. A string indicating whether the export to Log Analytics should use the default destination type, i.e. AzureDiagnostics, or use a destination type. |
| [`logCategoriesAndGroups`](#parameter-diagnosticsettingslogcategoriesandgroups) | No | array | Optional. The name of logs that will be streamed. "allLogs" includes all possible logs for the resource. Set to '' to disable log collection. |
| [`marketplacePartnerResourceId`](#parameter-diagnosticsettingsmarketplacepartnerresourceid) | No | string | Optional. The full ARM resource ID of the Marketplace resource to which you would like to send Diagnostic Logs. |
| [`name`](#parameter-diagnosticsettingsname) | No | string | Optional. The name of diagnostic setting. |
| [`storageAccountResourceId`](#parameter-diagnosticsettingsstorageaccountresourceid) | No | string | Optional. Resource ID of the diagnostic storage account. For security reasons, it is recommended to set diagnostic settings to send data to either storage account, log analytics workspace or event hub. |
| [`workspaceResourceId`](#parameter-diagnosticsettingsworkspaceresourceid) | No | string | Optional. Resource ID of the diagnostic log analytics workspace. For security reasons, it is recommended to set diagnostic settings to send data to either storage account, log analytics workspace or event hub. |

### Parameter: `diagnosticSettings.eventHubAuthorizationRuleResourceId`

Optional. Resource ID of the diagnostic event hub authorization rule for the Event Hubs namespace in which the event hub should be created or streamed to.

- Required: No
- Type: string

### Parameter: `diagnosticSettings.eventHubName`

Optional. Name of the diagnostic event hub within the namespace to which logs are streamed. Without this, an event hub is created for each log category. For security reasons, it is recommended to set diagnostic settings to send data to either storage account, log analytics workspace or event hub.

- Required: No
- Type: string

### Parameter: `diagnosticSettings.logAnalyticsDestinationType`

Optional. A string indicating whether the export to Log Analytics should use the default destination type, i.e. AzureDiagnostics, or use a destination type.

- Required: No
- Type: string
- Allowed: `[AzureDiagnostics, Dedicated]`

### Parameter: `diagnosticSettings.logCategoriesAndGroups`

Optional. The name of logs that will be streamed. "allLogs" includes all possible logs for the resource. Set to '' to disable log collection.

- Required: No
- Type: array

| Name | Required | Type | Description |
| :-- | :-- | :--| :-- |
| [`category`](#parameter-diagnosticsettingslogcategoriesandgroupscategory) | No | string | Optional. Name of a Diagnostic Log category for a resource type this setting is applied to. Set the specific logs to collect here. |
| [`categoryGroup`](#parameter-diagnosticsettingslogcategoriesandgroupscategorygroup) | No | string | Optional. Name of a Diagnostic Log category group for a resource type this setting is applied to. Set to 'AllLogs' to collect all logs. |

### Parameter: `diagnosticSettings.logCategoriesAndGroups.category`

Optional. Name of a Diagnostic Log category for a resource type this setting is applied to. Set the specific logs to collect here.

- Required: No
- Type: string

### Parameter: `diagnosticSettings.logCategoriesAndGroups.categoryGroup`

Optional. Name of a Diagnostic Log category group for a resource type this setting is applied to. Set to 'AllLogs' to collect all logs.

- Required: No
- Type: string


### Parameter: `diagnosticSettings.marketplacePartnerResourceId`

Optional. The full ARM resource ID of the Marketplace resource to which you would like to send Diagnostic Logs.

- Required: No
- Type: string

### Parameter: `diagnosticSettings.name`

Optional. The name of diagnostic setting.

- Required: No
- Type: string

### Parameter: `diagnosticSettings.storageAccountResourceId`

Optional. Resource ID of the diagnostic storage account. For security reasons, it is recommended to set diagnostic settings to send data to either storage account, log analytics workspace or event hub.

- Required: No
- Type: string

### Parameter: `diagnosticSettings.workspaceResourceId`

Optional. Resource ID of the diagnostic log analytics workspace. For security reasons, it is recommended to set diagnostic settings to send data to either storage account, log analytics workspace or event hub.

- Required: No
- Type: string

### Parameter: `disablePublicIp`

Disable Public IP.
- Required: No
- Type: bool
- Default: `False`

### Parameter: `enableDefaultTelemetry`

Enable telemetry via a Globally Unique Identifier (GUID).
- Required: No
- Type: bool
- Default: `True`

### Parameter: `loadBalancerBackendPoolName`

Name of the outbound Load Balancer Backend Pool for Secure Cluster Connectivity (No Public IP).
- Required: No
- Type: string
- Default: `''`

### Parameter: `loadBalancerResourceId`

Resource URI of Outbound Load balancer for Secure Cluster Connectivity (No Public IP) workspace.
- Required: No
- Type: string
- Default: `''`

### Parameter: `location`

Location for all Resources.
- Required: No
- Type: string
- Default: `[resourceGroup().location]`

### Parameter: `lock`

The lock settings of the service.
- Required: No
- Type: object


| Name | Required | Type | Description |
| :-- | :-- | :--| :-- |
| [`kind`](#parameter-lockkind) | No | string | Optional. Specify the type of lock. |
| [`name`](#parameter-lockname) | No | string | Optional. Specify the name of lock. |

### Parameter: `lock.kind`

Optional. Specify the type of lock.

- Required: No
- Type: string
- Allowed: `[CanNotDelete, None, ReadOnly]`

### Parameter: `lock.name`

Optional. Specify the name of lock.

- Required: No
- Type: string

### Parameter: `managedResourceGroupResourceId`

The managed resource group ID. It is created by the module as per the to-be resource ID you provide.
- Required: No
- Type: string
- Default: `''`

### Parameter: `name`

The name of the Azure Databricks workspace to create.
- Required: Yes
- Type: string

### Parameter: `natGatewayName`

Name of the NAT gateway for Secure Cluster Connectivity (No Public IP) workspace subnets.
- Required: No
- Type: string
- Default: `''`

### Parameter: `prepareEncryption`

Prepare the workspace for encryption. Enables the Managed Identity for managed storage account.
- Required: No
- Type: bool
- Default: `False`

### Parameter: `privateEndpoints`

Configuration details for private endpoints. For security reasons, it is recommended to use private endpoints whenever possible.
- Required: No
- Type: array


| Name | Required | Type | Description |
| :-- | :-- | :--| :-- |
| [`applicationSecurityGroupResourceIds`](#parameter-privateendpointsapplicationsecuritygroupresourceids) | No | array | Optional. Application security groups in which the private endpoint IP configuration is included. |
| [`customDnsConfigs`](#parameter-privateendpointscustomdnsconfigs) | No | array | Optional. Custom DNS configurations. |
| [`customNetworkInterfaceName`](#parameter-privateendpointscustomnetworkinterfacename) | No | string | Optional. The custom name of the network interface attached to the private endpoint. |
| [`enableTelemetry`](#parameter-privateendpointsenabletelemetry) | No | bool | Optional. Enable/Disable usage telemetry for module. |
| [`ipConfigurations`](#parameter-privateendpointsipconfigurations) | No | array | Optional. A list of IP configurations of the private endpoint. This will be used to map to the First Party Service endpoints. |
| [`location`](#parameter-privateendpointslocation) | No | string | Optional. The location to deploy the private endpoint to. |
| [`lock`](#parameter-privateendpointslock) | No | object | Optional. Specify the type of lock. |
| [`manualPrivateLinkServiceConnections`](#parameter-privateendpointsmanualprivatelinkserviceconnections) | No | array | Optional. Manual PrivateLink Service Connections. |
| [`name`](#parameter-privateendpointsname) | No | string | Optional. The name of the private endpoint. |
| [`privateDnsZoneGroupName`](#parameter-privateendpointsprivatednszonegroupname) | No | string | Optional. The name of the private DNS zone group to create if privateDnsZoneResourceIds were provided. |
| [`privateDnsZoneResourceIds`](#parameter-privateendpointsprivatednszoneresourceids) | No | array | Optional. The private DNS zone groups to associate the private endpoint with. A DNS zone group can support up to 5 DNS zones. |
| [`roleAssignments`](#parameter-privateendpointsroleassignments) | No | array | Optional. Array of role assignment objects that contain the 'roleDefinitionIdOrName' and 'principalId' to define RBAC role assignments on this resource. In the roleDefinitionIdOrName attribute, you can provide either the display name of the role definition, or its fully qualified ID in the following format: '/providers/Microsoft.Authorization/roleDefinitions/c2f4ef07-c644-48eb-af81-4b1b4947fb11'. |
| [`service`](#parameter-privateendpointsservice) | No | string | Optional. The service (sub-) type to deploy the private endpoint for. For example "vault" or "blob". |
| [`subnetResourceId`](#parameter-privateendpointssubnetresourceid) | Yes | string | Required. Resource ID of the subnet where the endpoint needs to be created. |
| [`tags`](#parameter-privateendpointstags) | No | object | Optional. Tags to be applied on all resources/resource groups in this deployment. |

### Parameter: `privateEndpoints.applicationSecurityGroupResourceIds`

Optional. Application security groups in which the private endpoint IP configuration is included.

- Required: No
- Type: array

### Parameter: `privateEndpoints.customDnsConfigs`

Optional. Custom DNS configurations.

- Required: No
- Type: array

| Name | Required | Type | Description |
| :-- | :-- | :--| :-- |
| [`fqdn`](#parameter-privateendpointscustomdnsconfigsfqdn) | No | string | Required. Fqdn that resolves to private endpoint ip address. |
| [`ipAddresses`](#parameter-privateendpointscustomdnsconfigsipaddresses) | Yes | array | Required. A list of private ip addresses of the private endpoint. |

### Parameter: `privateEndpoints.customDnsConfigs.fqdn`

Required. Fqdn that resolves to private endpoint ip address.

- Required: No
- Type: string

### Parameter: `privateEndpoints.customDnsConfigs.ipAddresses`

Required. A list of private ip addresses of the private endpoint.

- Required: Yes
- Type: array


### Parameter: `privateEndpoints.customNetworkInterfaceName`

Optional. The custom name of the network interface attached to the private endpoint.

- Required: No
- Type: string

### Parameter: `privateEndpoints.enableTelemetry`

Optional. Enable/Disable usage telemetry for module.

- Required: No
- Type: bool

### Parameter: `privateEndpoints.ipConfigurations`

Optional. A list of IP configurations of the private endpoint. This will be used to map to the First Party Service endpoints.

- Required: No
- Type: array

| Name | Required | Type | Description |
| :-- | :-- | :--| :-- |
| [`name`](#parameter-privateendpointsipconfigurationsname) | Yes | string | Required. The name of the resource that is unique within a resource group. |
| [`properties`](#parameter-privateendpointsipconfigurationsproperties) | Yes | object | Required. Properties of private endpoint IP configurations. |

### Parameter: `privateEndpoints.ipConfigurations.name`

Required. The name of the resource that is unique within a resource group.

- Required: Yes
- Type: string

### Parameter: `privateEndpoints.ipConfigurations.properties`

Required. Properties of private endpoint IP configurations.

- Required: Yes
- Type: object

| Name | Required | Type | Description |
| :-- | :-- | :--| :-- |
| [`groupId`](#parameter-privateendpointsipconfigurationspropertiesgroupid) | Yes | string | Required. The ID of a group obtained from the remote resource that this private endpoint should connect to. |
| [`memberName`](#parameter-privateendpointsipconfigurationspropertiesmembername) | Yes | string | Required. The member name of a group obtained from the remote resource that this private endpoint should connect to. |
| [`privateIPAddress`](#parameter-privateendpointsipconfigurationspropertiesprivateipaddress) | Yes | string | Required. A private ip address obtained from the private endpoint's subnet. |

### Parameter: `privateEndpoints.ipConfigurations.properties.groupId`

Required. The ID of a group obtained from the remote resource that this private endpoint should connect to.

- Required: Yes
- Type: string

### Parameter: `privateEndpoints.ipConfigurations.properties.memberName`

Required. The member name of a group obtained from the remote resource that this private endpoint should connect to.

- Required: Yes
- Type: string

### Parameter: `privateEndpoints.ipConfigurations.properties.privateIPAddress`

Required. A private ip address obtained from the private endpoint's subnet.

- Required: Yes
- Type: string



### Parameter: `privateEndpoints.location`

Optional. The location to deploy the private endpoint to.

- Required: No
- Type: string

### Parameter: `privateEndpoints.lock`

Optional. Specify the type of lock.

- Required: No
- Type: object

### Parameter: `privateEndpoints.manualPrivateLinkServiceConnections`

Optional. Manual PrivateLink Service Connections.

- Required: No
- Type: array

### Parameter: `privateEndpoints.name`

Optional. The name of the private endpoint.

- Required: No
- Type: string

### Parameter: `privateEndpoints.privateDnsZoneGroupName`

Optional. The name of the private DNS zone group to create if privateDnsZoneResourceIds were provided.

- Required: No
- Type: string

### Parameter: `privateEndpoints.privateDnsZoneResourceIds`

Optional. The private DNS zone groups to associate the private endpoint with. A DNS zone group can support up to 5 DNS zones.

- Required: No
- Type: array

### Parameter: `privateEndpoints.roleAssignments`

Optional. Array of role assignment objects that contain the 'roleDefinitionIdOrName' and 'principalId' to define RBAC role assignments on this resource. In the roleDefinitionIdOrName attribute, you can provide either the display name of the role definition, or its fully qualified ID in the following format: '/providers/Microsoft.Authorization/roleDefinitions/c2f4ef07-c644-48eb-af81-4b1b4947fb11'.

- Required: No
- Type: array

### Parameter: `privateEndpoints.service`

Optional. The service (sub-) type to deploy the private endpoint for. For example "vault" or "blob".

- Required: No
- Type: string

### Parameter: `privateEndpoints.subnetResourceId`

Required. Resource ID of the subnet where the endpoint needs to be created.

- Required: Yes
- Type: string

### Parameter: `privateEndpoints.tags`

Optional. Tags to be applied on all resources/resource groups in this deployment.

- Required: No
- Type: object

### Parameter: `publicIpName`

Name of the Public IP for No Public IP workspace with managed vNet.
- Required: No
- Type: string
- Default: `''`

### Parameter: `publicNetworkAccess`

	The network access type for accessing workspace. Set value to disabled to access workspace only via private link.
- Required: No
- Type: string
- Default: `'Enabled'`
- Allowed:
  ```Bicep
  [
    'Disabled'
    'Enabled'
  ]
  ```

### Parameter: `requiredNsgRules`

Gets or sets a value indicating whether data plane (clusters) to control plane communication happen over private endpoint.
- Required: No
- Type: string
- Default: `'AllRules'`
- Allowed:
  ```Bicep
  [
    'AllRules'
    'NoAzureDatabricksRules'
  ]
  ```

### Parameter: `requireInfrastructureEncryption`

A boolean indicating whether or not the DBFS root file system will be enabled with secondary layer of encryption with platform managed keys for data at rest.
- Required: No
- Type: bool
- Default: `False`

### Parameter: `roleAssignments`

Array of role assignment objects that contain the 'roleDefinitionIdOrName' and 'principalId' to define RBAC role assignments on this resource. In the roleDefinitionIdOrName attribute, you can provide either the display name of the role definition, or its fully qualified ID in the following format: '/providers/Microsoft.Authorization/roleDefinitions/c2f4ef07-c644-48eb-af81-4b1b4947fb11'.
- Required: No
- Type: array


| Name | Required | Type | Description |
| :-- | :-- | :--| :-- |
| [`condition`](#parameter-roleassignmentscondition) | No | string | Optional. The conditions on the role assignment. This limits the resources it can be assigned to. e.g.: @Resource[Microsoft.Storage/storageAccounts/blobServices/containers:ContainerName] StringEqualsIgnoreCase "foo_storage_container" |
| [`conditionVersion`](#parameter-roleassignmentsconditionversion) | No | string | Optional. Version of the condition. |
| [`delegatedManagedIdentityResourceId`](#parameter-roleassignmentsdelegatedmanagedidentityresourceid) | No | string | Optional. The Resource Id of the delegated managed identity resource. |
| [`description`](#parameter-roleassignmentsdescription) | No | string | Optional. The description of the role assignment. |
| [`principalId`](#parameter-roleassignmentsprincipalid) | Yes | string | Required. The principal ID of the principal (user/group/identity) to assign the role to. |
| [`principalType`](#parameter-roleassignmentsprincipaltype) | No | string | Optional. The principal type of the assigned principal ID. |
| [`roleDefinitionIdOrName`](#parameter-roleassignmentsroledefinitionidorname) | Yes | string | Required. The name of the role to assign. If it cannot be found you can specify the role definition ID instead. |

### Parameter: `roleAssignments.condition`

Optional. The conditions on the role assignment. This limits the resources it can be assigned to. e.g.: @Resource[Microsoft.Storage/storageAccounts/blobServices/containers:ContainerName] StringEqualsIgnoreCase "foo_storage_container"

- Required: No
- Type: string

### Parameter: `roleAssignments.conditionVersion`

Optional. Version of the condition.

- Required: No
- Type: string
- Allowed: `[2.0]`

### Parameter: `roleAssignments.delegatedManagedIdentityResourceId`

Optional. The Resource Id of the delegated managed identity resource.

- Required: No
- Type: string

### Parameter: `roleAssignments.description`

Optional. The description of the role assignment.

- Required: No
- Type: string

### Parameter: `roleAssignments.principalId`

Required. The principal ID of the principal (user/group/identity) to assign the role to.

- Required: Yes
- Type: string

### Parameter: `roleAssignments.principalType`

Optional. The principal type of the assigned principal ID.

- Required: No
- Type: string
- Allowed: `[Device, ForeignGroup, Group, ServicePrincipal, User]`

### Parameter: `roleAssignments.roleDefinitionIdOrName`

Required. The name of the role to assign. If it cannot be found you can specify the role definition ID instead.

- Required: Yes
- Type: string

### Parameter: `skuName`

The pricing tier of workspace.
- Required: No
- Type: string
- Default: `'premium'`
- Allowed:
  ```Bicep
  [
    'premium'
    'standard'
    'trial'
  ]
  ```

### Parameter: `storageAccountName`

Default DBFS storage account name.
- Required: No
- Type: string
- Default: `''`

### Parameter: `storageAccountSkuName`

Storage account SKU name.
- Required: No
- Type: string
- Default: `'Standard_GRS'`

### Parameter: `tags`

Tags of the resource.
- Required: No
- Type: object

### Parameter: `vnetAddressPrefix`

Address prefix for Managed virtual network.
- Required: No
- Type: string
- Default: `'10.139'`


## Outputs

| Output | Type | Description |
| :-- | :-- | :-- |
| `location` | string | The location the resource was deployed into. |
| `name` | string | The name of the deployed databricks workspace. |
| `resourceGroupName` | string | The resource group of the deployed databricks workspace. |
| `resourceId` | string | The resource ID of the deployed databricks workspace. |

## Cross-referenced modules

This section gives you an overview of all local-referenced module files (i.e., other CARML modules that are referenced in this module) and all remote-referenced files (i.e., Bicep modules that are referenced from a Bicep Registry or Template Specs).

| Reference | Type |
| :-- | :-- |
| `modules/network/private-endpoint` | Local reference |

## Notes

### Parameter Usage: `customPublicSubnetName` and `customPrivateSubnetName`

- Require Network Security Groups attached to the subnets (Note: Rule don't have to be set, they are set through the deployment)

- The two subnets also need the delegation to service `Microsoft.Databricks/workspaces`

### Parameter Usage: `parameters`

- Include only those elements (e.g. amlWorkspaceId) as object if specified, otherwise remove it.

<details>

<summary>Parameter JSON format</summary>

```json
"parameters": {
    "value": {
        "amlWorkspaceId": {
            "value": "/subscriptions/xxx/resourceGroups/xxx/providers/Microsoft.MachineLearningServices/workspaces/xxx"
        },
        "customVirtualNetworkId": {
            "value": "/subscriptions/xxx/resourceGroups/xxx/providers/Microsoft.Network/virtualNetworks/xxx"
        },
        "customPublicSubnetName": {
            "value": "xxx"
        },
        "customPrivateSubnetName": {
            "value": "xxx"
        },
        "enableNoPublicIp": {
            "value": true
        }
    }
}
```

</details>

<details>

<summary>Bicep format</summary>

```bicep
parameters: {
    amlWorkspaceId: {
        value: '/subscriptions/xxx/resourceGroups/xxx/providers/Microsoft.MachineLearningServices/workspaces/xxx'
    }
    customVirtualNetworkId: {
        value: '/subscriptions/xxx/resourceGroups/xxx/providers/Microsoft.Network/virtualNetworks/xxx'
    }
    customPublicSubnetName: {
        value: 'xxx'
    }
    customPrivateSubnetName: {
        value: 'xxx'
    }
    enableNoPublicIp: {
        value: true
    }
}
```

</details>
<p>
