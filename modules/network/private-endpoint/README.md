# Private Endpoints `[Microsoft.Network/privateEndpoints]`

> This module has already been migrated to [AVM](https://github.com/Azure/bicep-registry-modules/tree/main/avm/res). Only the AVM version is expected to receive updates / new features. Please do not work on improving this module in [CARML](https://aka.ms/carml).

This module deploys a Private Endpoint.

## Navigation

- [Resource Types](#Resource-Types)
- [Usage examples](#Usage-examples)
- [Parameters](#Parameters)
- [Outputs](#Outputs)
- [Cross-referenced modules](#Cross-referenced-modules)

## Resource Types

| Resource Type | API Version |
| :-- | :-- |
| `Microsoft.Authorization/locks` | [2020-05-01](https://learn.microsoft.com/en-us/azure/templates/Microsoft.Authorization/2020-05-01/locks) |
| `Microsoft.Authorization/roleAssignments` | [2022-04-01](https://learn.microsoft.com/en-us/azure/templates/Microsoft.Authorization/2022-04-01/roleAssignments) |
| `Microsoft.Network/privateEndpoints` | [2023-04-01](https://learn.microsoft.com/en-us/azure/templates/Microsoft.Network/2023-04-01/privateEndpoints) |
| `Microsoft.Network/privateEndpoints/privateDnsZoneGroups` | [2023-04-01](https://learn.microsoft.com/en-us/azure/templates/Microsoft.Network/2023-04-01/privateEndpoints/privateDnsZoneGroups) |

## Usage examples

The following section provides usage examples for the module, which were used to validate and deploy the module successfully. For a full reference, please review the module's test folder in its repository.

>**Note**: Each example lists all the required parameters first, followed by the rest - each in alphabetical order.

>**Note**: To reference the module, please use the following syntax `br:bicep/modules/network.private-endpoint:1.0.0`.

- [Using only defaults](#example-1-using-only-defaults)
- [Using large parameter set](#example-2-using-large-parameter-set)

### Example 1: _Using only defaults_

This instance deploys the module with the minimum set of required parameters.


<details>

<summary>via Bicep module</summary>

```bicep
module privateEndpoint 'br:bicep/modules/network.private-endpoint:1.0.0' = {
  name: '${uniqueString(deployment().name, location)}-test-npemin'
  params: {
    // Required parameters
    groupIds: [
      'vault'
    ]
    name: 'npemin001'
    serviceResourceId: '<serviceResourceId>'
    subnetResourceId: '<subnetResourceId>'
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
    "groupIds": {
      "value": [
        "vault"
      ]
    },
    "name": {
      "value": "npemin001"
    },
    "serviceResourceId": {
      "value": "<serviceResourceId>"
    },
    "subnetResourceId": {
      "value": "<subnetResourceId>"
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
module privateEndpoint 'br:bicep/modules/network.private-endpoint:1.0.0' = {
  name: '${uniqueString(deployment().name, location)}-test-npemax'
  params: {
    // Required parameters
    groupIds: [
      'vault'
    ]
    name: 'npemax001'
    serviceResourceId: '<serviceResourceId>'
    subnetResourceId: '<subnetResourceId>'
    // Non-required parameters
    applicationSecurityGroupResourceIds: [
      '<applicationSecurityGroupResourceId>'
    ]
    customDnsConfigs: [
      {
        fqdn: 'abc.keyvault.com'
        ipAddresses: [
          '10.0.0.10'
        ]
      }
    ]
    customNetworkInterfaceName: 'npemax001nic'
    enableDefaultTelemetry: '<enableDefaultTelemetry>'
    ipConfigurations: [
      {
        name: 'myIPconfig'
        properties: {
          groupId: 'vault'
          memberName: 'default'
          privateIPAddress: '10.0.0.10'
        }
      }
    ]
    lock: {
      kind: 'CanNotDelete'
      name: 'myCustomLockName'
    }
    privateDnsZoneResourceIds: [
      '<privateDNSZoneResourceId>'
    ]
    roleAssignments: [
      {
        principalId: '<principalId>'
        principalType: 'ServicePrincipal'
        roleDefinitionIdOrName: 'Reader'
      }
    ]
    tags: {
      Environment: 'Non-Prod'
      'hidden-title': 'This is visible in the resource name'
      Role: 'DeploymentValidation'
    }
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
    "groupIds": {
      "value": [
        "vault"
      ]
    },
    "name": {
      "value": "npemax001"
    },
    "serviceResourceId": {
      "value": "<serviceResourceId>"
    },
    "subnetResourceId": {
      "value": "<subnetResourceId>"
    },
    // Non-required parameters
    "applicationSecurityGroupResourceIds": {
      "value": [
        "<applicationSecurityGroupResourceId>"
      ]
    },
    "customDnsConfigs": {
      "value": [
        {
          "fqdn": "abc.keyvault.com",
          "ipAddresses": [
            "10.0.0.10"
          ]
        }
      ]
    },
    "customNetworkInterfaceName": {
      "value": "npemax001nic"
    },
    "enableDefaultTelemetry": {
      "value": "<enableDefaultTelemetry>"
    },
    "ipConfigurations": {
      "value": [
        {
          "name": "myIPconfig",
          "properties": {
            "groupId": "vault",
            "memberName": "default",
            "privateIPAddress": "10.0.0.10"
          }
        }
      ]
    },
    "lock": {
      "value": {
        "kind": "CanNotDelete",
        "name": "myCustomLockName"
      }
    },
    "privateDnsZoneResourceIds": {
      "value": [
        "<privateDNSZoneResourceId>"
      ]
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
    "tags": {
      "value": {
        "Environment": "Non-Prod",
        "hidden-title": "This is visible in the resource name",
        "Role": "DeploymentValidation"
      }
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
| [`groupIds`](#parameter-groupids) | array | Subtype(s) of the connection to be created. The allowed values depend on the type serviceResourceId refers to. |
| [`name`](#parameter-name) | string | Name of the private endpoint resource to create. |
| [`serviceResourceId`](#parameter-serviceresourceid) | string | Resource ID of the resource that needs to be connected to the network. |
| [`subnetResourceId`](#parameter-subnetresourceid) | string | Resource ID of the subnet where the endpoint needs to be created. |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`applicationSecurityGroupResourceIds`](#parameter-applicationsecuritygroupresourceids) | array | Application security groups in which the private endpoint IP configuration is included. |
| [`customDnsConfigs`](#parameter-customdnsconfigs) | array | Custom DNS configurations. |
| [`customNetworkInterfaceName`](#parameter-customnetworkinterfacename) | string | The custom name of the network interface attached to the private endpoint. |
| [`enableDefaultTelemetry`](#parameter-enabledefaulttelemetry) | bool | Enable/Disable usage telemetry for module. |
| [`ipConfigurations`](#parameter-ipconfigurations) | array | A list of IP configurations of the private endpoint. This will be used to map to the First Party Service endpoints. |
| [`location`](#parameter-location) | string | Location for all Resources. |
| [`lock`](#parameter-lock) | object | The lock settings of the service. |
| [`manualPrivateLinkServiceConnections`](#parameter-manualprivatelinkserviceconnections) | array | Manual PrivateLink Service Connections. |
| [`privateDnsZoneGroupName`](#parameter-privatednszonegroupname) | string | The name of the private DNS zone group to create if `privateDnsZoneResourceIds` were provided. |
| [`privateDnsZoneResourceIds`](#parameter-privatednszoneresourceids) | array | The private DNS zone groups to associate the private endpoint. A DNS zone group can support up to 5 DNS zones. |
| [`roleAssignments`](#parameter-roleassignments) | array | Array of role assignment objects that contain the 'roleDefinitionIdOrName' and 'principalId' to define RBAC role assignments on this resource. In the roleDefinitionIdOrName attribute, you can provide either the display name of the role definition, or its fully qualified ID in the following format: '/providers/Microsoft.Authorization/roleDefinitions/c2f4ef07-c644-48eb-af81-4b1b4947fb11'. |
| [`tags`](#parameter-tags) | object | Tags to be applied on all resources/resource groups in this deployment. |

### Parameter: `applicationSecurityGroupResourceIds`

Application security groups in which the private endpoint IP configuration is included.
- Required: No
- Type: array

### Parameter: `customDnsConfigs`

Custom DNS configurations.
- Required: No
- Type: array


| Name | Required | Type | Description |
| :-- | :-- | :--| :-- |
| [`fqdn`](#parameter-customdnsconfigsfqdn) | Yes | string | Required. Fqdn that resolves to private endpoint ip address. |
| [`ipAddresses`](#parameter-customdnsconfigsipaddresses) | Yes | array | Required. A list of private ip addresses of the private endpoint. |

### Parameter: `customDnsConfigs.fqdn`

Required. Fqdn that resolves to private endpoint ip address.

- Required: Yes
- Type: string

### Parameter: `customDnsConfigs.ipAddresses`

Required. A list of private ip addresses of the private endpoint.

- Required: Yes
- Type: array

### Parameter: `customNetworkInterfaceName`

The custom name of the network interface attached to the private endpoint.
- Required: No
- Type: string

### Parameter: `enableDefaultTelemetry`

Enable/Disable usage telemetry for module.
- Required: No
- Type: bool
- Default: `True`

### Parameter: `groupIds`

Subtype(s) of the connection to be created. The allowed values depend on the type serviceResourceId refers to.
- Required: Yes
- Type: array

### Parameter: `ipConfigurations`

A list of IP configurations of the private endpoint. This will be used to map to the First Party Service endpoints.
- Required: No
- Type: array


| Name | Required | Type | Description |
| :-- | :-- | :--| :-- |
| [`name`](#parameter-ipconfigurationsname) | Yes | string | Required. The name of the resource that is unique within a resource group. |
| [`properties`](#parameter-ipconfigurationsproperties) | Yes | object | Required. Properties of private endpoint IP configurations. |

### Parameter: `ipConfigurations.name`

Required. The name of the resource that is unique within a resource group.

- Required: Yes
- Type: string

### Parameter: `ipConfigurations.properties`

Required. Properties of private endpoint IP configurations.

- Required: Yes
- Type: object

| Name | Required | Type | Description |
| :-- | :-- | :--| :-- |
| [`groupId`](#parameter-ipconfigurationspropertiesgroupid) | Yes | string | Required. The ID of a group obtained from the remote resource that this private endpoint should connect to. |
| [`memberName`](#parameter-ipconfigurationspropertiesmembername) | Yes | string | Required. The member name of a group obtained from the remote resource that this private endpoint should connect to. |
| [`privateIPAddress`](#parameter-ipconfigurationspropertiesprivateipaddress) | Yes | string | Required. A private ip address obtained from the private endpoint's subnet. |

### Parameter: `ipConfigurations.properties.groupId`

Required. The ID of a group obtained from the remote resource that this private endpoint should connect to.

- Required: Yes
- Type: string

### Parameter: `ipConfigurations.properties.memberName`

Required. The member name of a group obtained from the remote resource that this private endpoint should connect to.

- Required: Yes
- Type: string

### Parameter: `ipConfigurations.properties.privateIPAddress`

Required. A private ip address obtained from the private endpoint's subnet.

- Required: Yes
- Type: string


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

### Parameter: `manualPrivateLinkServiceConnections`

Manual PrivateLink Service Connections.
- Required: No
- Type: array

### Parameter: `name`

Name of the private endpoint resource to create.
- Required: Yes
- Type: string

### Parameter: `privateDnsZoneGroupName`

The name of the private DNS zone group to create if `privateDnsZoneResourceIds` were provided.
- Required: No
- Type: string

### Parameter: `privateDnsZoneResourceIds`

The private DNS zone groups to associate the private endpoint. A DNS zone group can support up to 5 DNS zones.
- Required: No
- Type: array

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

### Parameter: `serviceResourceId`

Resource ID of the resource that needs to be connected to the network.
- Required: Yes
- Type: string

### Parameter: `subnetResourceId`

Resource ID of the subnet where the endpoint needs to be created.
- Required: Yes
- Type: string

### Parameter: `tags`

Tags to be applied on all resources/resource groups in this deployment.
- Required: No
- Type: object


## Outputs

| Output | Type | Description |
| :-- | :-- | :-- |
| `location` | string | The location the resource was deployed into. |
| `name` | string | The name of the private endpoint. |
| `resourceGroupName` | string | The resource group the private endpoint was deployed into. |
| `resourceId` | string | The resource ID of the private endpoint. |

## Cross-referenced modules

_None_
