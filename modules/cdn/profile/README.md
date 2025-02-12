# CDN Profiles `[Microsoft.Cdn/profiles]`

This module deploys a CDN Profile.

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
| `Microsoft.Cdn/profiles` | [2023-05-01](https://learn.microsoft.com/en-us/azure/templates/Microsoft.Cdn/profiles) |
| `Microsoft.Cdn/profiles/afdEndpoints` | [2023-05-01](https://learn.microsoft.com/en-us/azure/templates/Microsoft.Cdn/profiles/afdEndpoints) |
| `Microsoft.Cdn/profiles/afdEndpoints/routes` | [2023-05-01](https://learn.microsoft.com/en-us/azure/templates/Microsoft.Cdn/profiles/afdEndpoints/routes) |
| `Microsoft.Cdn/profiles/customDomains` | [2023-05-01](https://learn.microsoft.com/en-us/azure/templates/Microsoft.Cdn/profiles/customDomains) |
| `Microsoft.Cdn/profiles/endpoints` | [2021-06-01](https://learn.microsoft.com/en-us/azure/templates/Microsoft.Cdn/2021-06-01/profiles/endpoints) |
| `Microsoft.Cdn/profiles/endpoints/origins` | [2021-06-01](https://learn.microsoft.com/en-us/azure/templates/Microsoft.Cdn/2021-06-01/profiles/endpoints/origins) |
| `Microsoft.Cdn/profiles/originGroups` | [2023-05-01](https://learn.microsoft.com/en-us/azure/templates/Microsoft.Cdn/profiles/originGroups) |
| `Microsoft.Cdn/profiles/originGroups/origins` | [2023-05-01](https://learn.microsoft.com/en-us/azure/templates/Microsoft.Cdn/profiles/originGroups/origins) |
| `Microsoft.Cdn/profiles/ruleSets` | [2023-05-01](https://learn.microsoft.com/en-us/azure/templates/Microsoft.Cdn/profiles/ruleSets) |
| `Microsoft.Cdn/profiles/ruleSets/rules` | [2023-05-01](https://learn.microsoft.com/en-us/azure/templates/Microsoft.Cdn/profiles/ruleSets/rules) |
| `Microsoft.Cdn/profiles/secrets` | [2023-05-01](https://learn.microsoft.com/en-us/azure/templates/Microsoft.Cdn/profiles/secrets) |

## Usage examples

The following section provides usage examples for the module, which were used to validate and deploy the module successfully. For a full reference, please review the module's test folder in its repository.

>**Note**: Each example lists all the required parameters first, followed by the rest - each in alphabetical order.

>**Note**: To reference the module, please use the following syntax `br:bicep/modules/cdn.profile:1.0.0`.

- [Afd](#example-1-afd)
- [Using large parameter set](#example-2-using-large-parameter-set)

### Example 1: _Afd_

<details>

<summary>via Bicep module</summary>

```bicep
module profile 'br:bicep/modules/cdn.profile:1.0.0' = {
  name: '${uniqueString(deployment().name, location)}-test-cdnpafd'
  params: {
    // Required parameters
    name: 'dep-test-cdnpafd'
    sku: 'Standard_AzureFrontDoor'
    // Non-required parameters
    afdEndpoints: [
      {
        name: 'dep-test-cdnpafd-afd-endpoint'
        routes: [
          {
            customDomainName: 'dep-test-cdnpafd-custom-domain'
            name: 'dep-test-cdnpafd-afd-route'
            originGroupName: 'dep-test-cdnpafd-origin-group'
            ruleSets: [
              {
                name: 'deptestcdnpafdruleset'
              }
            ]
          }
        ]
      }
    ]
    customDomains: [
      {
        certificateType: 'ManagedCertificate'
        hostName: 'dep-test-cdnpafd-custom-domain.azurewebsites.net'
        name: 'dep-test-cdnpafd-custom-domain'
      }
    ]
    enableDefaultTelemetry: '<enableDefaultTelemetry>'
    location: 'global'
    lock: {
      kind: 'CanNotDelete'
      name: 'myCustomLockName'
    }
    originResponseTimeoutSeconds: 60
    origionGroups: [
      {
        loadBalancingSettings: {
          additionalLatencyInMilliseconds: 50
          sampleSize: 4
          successfulSamplesRequired: 3
        }
        name: 'dep-test-cdnpafd-origin-group'
        origins: [
          {
            hostName: 'dep-test-cdnpafd-origin.azurewebsites.net'
            name: 'dep-test-cdnpafd-origin'
          }
        ]
      }
    ]
    roleAssignments: [
      {
        principalId: '<principalId>'
        principalType: 'ServicePrincipal'
        roleDefinitionIdOrName: 'Reader'
      }
    ]
    ruleSets: [
      {
        name: 'deptestcdnpafdruleset'
        rules: [
          {
            actions: [
              {
                name: 'UrlRedirect'
                parameters: {
                  customHostname: 'dev-etradefd.trade.azure.defra.cloud'
                  customPath: '/test123'
                  destinationProtocol: 'Https'
                  redirectType: 'PermanentRedirect'
                  typeName: 'DeliveryRuleUrlRedirectActionParameters'
                }
              }
            ]
            name: 'deptestcdnpafdrule'
            order: 1
          }
        ]
      }
    ]
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
      "value": "dep-test-cdnpafd"
    },
    "sku": {
      "value": "Standard_AzureFrontDoor"
    },
    // Non-required parameters
    "afdEndpoints": {
      "value": [
        {
          "name": "dep-test-cdnpafd-afd-endpoint",
          "routes": [
            {
              "customDomainName": "dep-test-cdnpafd-custom-domain",
              "name": "dep-test-cdnpafd-afd-route",
              "originGroupName": "dep-test-cdnpafd-origin-group",
              "ruleSets": [
                {
                  "name": "deptestcdnpafdruleset"
                }
              ]
            }
          ]
        }
      ]
    },
    "customDomains": {
      "value": [
        {
          "certificateType": "ManagedCertificate",
          "hostName": "dep-test-cdnpafd-custom-domain.azurewebsites.net",
          "name": "dep-test-cdnpafd-custom-domain"
        }
      ]
    },
    "enableDefaultTelemetry": {
      "value": "<enableDefaultTelemetry>"
    },
    "location": {
      "value": "global"
    },
    "lock": {
      "value": {
        "kind": "CanNotDelete",
        "name": "myCustomLockName"
      }
    },
    "originResponseTimeoutSeconds": {
      "value": 60
    },
    "origionGroups": {
      "value": [
        {
          "loadBalancingSettings": {
            "additionalLatencyInMilliseconds": 50,
            "sampleSize": 4,
            "successfulSamplesRequired": 3
          },
          "name": "dep-test-cdnpafd-origin-group",
          "origins": [
            {
              "hostName": "dep-test-cdnpafd-origin.azurewebsites.net",
              "name": "dep-test-cdnpafd-origin"
            }
          ]
        }
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
    "ruleSets": {
      "value": [
        {
          "name": "deptestcdnpafdruleset",
          "rules": [
            {
              "actions": [
                {
                  "name": "UrlRedirect",
                  "parameters": {
                    "customHostname": "dev-etradefd.trade.azure.defra.cloud",
                    "customPath": "/test123",
                    "destinationProtocol": "Https",
                    "redirectType": "PermanentRedirect",
                    "typeName": "DeliveryRuleUrlRedirectActionParameters"
                  }
                }
              ],
              "name": "deptestcdnpafdrule",
              "order": 1
            }
          ]
        }
      ]
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
module profile 'br:bicep/modules/cdn.profile:1.0.0' = {
  name: '${uniqueString(deployment().name, location)}-test-cdnpmax'
  params: {
    // Required parameters
    name: 'dep-test-cdnpmax'
    sku: 'Standard_Verizon'
    // Non-required parameters
    enableDefaultTelemetry: '<enableDefaultTelemetry>'
    endpointProperties: {
      contentTypesToCompress: [
        'application/javascript'
        'application/json'
        'application/x-javascript'
        'application/xml'
        'text/css'
        'text/html'
        'text/javascript'
        'text/plain'
      ]
      geoFilters: []
      isCompressionEnabled: true
      isHttpAllowed: true
      isHttpsAllowed: true
      originGroups: []
      originHostHeader: '<originHostHeader>'
      origins: [
        {
          name: 'dep-cdn-endpoint01'
          properties: {
            enabled: true
            hostName: '<hostName>'
            httpPort: 80
            httpsPort: 443
          }
        }
      ]
      queryStringCachingBehavior: 'IgnoreQueryString'
    }
    location: '<location>'
    lock: {
      kind: 'CanNotDelete'
      name: 'myCustomLockName'
    }
    originResponseTimeoutSeconds: 60
    roleAssignments: [
      {
        principalId: '<principalId>'
        principalType: 'ServicePrincipal'
        roleDefinitionIdOrName: 'Reader'
      }
    ]
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
      "value": "dep-test-cdnpmax"
    },
    "sku": {
      "value": "Standard_Verizon"
    },
    // Non-required parameters
    "enableDefaultTelemetry": {
      "value": "<enableDefaultTelemetry>"
    },
    "endpointProperties": {
      "value": {
        "contentTypesToCompress": [
          "application/javascript",
          "application/json",
          "application/x-javascript",
          "application/xml",
          "text/css",
          "text/html",
          "text/javascript",
          "text/plain"
        ],
        "geoFilters": [],
        "isCompressionEnabled": true,
        "isHttpAllowed": true,
        "isHttpsAllowed": true,
        "originGroups": [],
        "originHostHeader": "<originHostHeader>",
        "origins": [
          {
            "name": "dep-cdn-endpoint01",
            "properties": {
              "enabled": true,
              "hostName": "<hostName>",
              "httpPort": 80,
              "httpsPort": 443
            }
          }
        ],
        "queryStringCachingBehavior": "IgnoreQueryString"
      }
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
    "originResponseTimeoutSeconds": {
      "value": 60
    },
    "roleAssignments": {
      "value": [
        {
          "principalId": "<principalId>",
          "principalType": "ServicePrincipal",
          "roleDefinitionIdOrName": "Reader"
        }
      ]
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
| [`name`](#parameter-name) | string | Name of the CDN profile. |
| [`sku`](#parameter-sku) | string | The pricing tier (defines a CDN provider, feature list and rate) of the CDN profile. |

**Conditional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`origionGroups`](#parameter-origiongroups) | array | Array of origin group objects. Required if the afdEndpoints is specified. |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`afdEndpoints`](#parameter-afdendpoints) | array | Array of AFD endpoint objects. |
| [`customDomains`](#parameter-customdomains) | array | Array of custom domain objects. |
| [`enableDefaultTelemetry`](#parameter-enabledefaulttelemetry) | bool | Enable telemetry via a Globally Unique Identifier (GUID). |
| [`endpointName`](#parameter-endpointname) | string | Name of the endpoint under the profile which is unique globally. |
| [`endpointProperties`](#parameter-endpointproperties) | object | Endpoint properties (see https://learn.microsoft.com/en-us/azure/templates/microsoft.cdn/profiles/endpoints?pivots=deployment-language-bicep#endpointproperties for details). |
| [`location`](#parameter-location) | string | Location for all Resources. |
| [`lock`](#parameter-lock) | object | The lock settings of the service. |
| [`originResponseTimeoutSeconds`](#parameter-originresponsetimeoutseconds) | int | Send and receive timeout on forwarding request to the origin. |
| [`roleAssignments`](#parameter-roleassignments) | array | Array of role assignment objects that contain the 'roleDefinitionIdOrName' and 'principalId' to define RBAC role assignments on this resource. In the roleDefinitionIdOrName attribute, you can provide either the display name of the role definition, or its fully qualified ID in the following format: '/providers/Microsoft.Authorization/roleDefinitions/c2f4ef07-c644-48eb-af81-4b1b4947fb11'. |
| [`ruleSets`](#parameter-rulesets) | array | Array of rule set objects. |
| [`secrets`](#parameter-secrets) | array | Array of secret objects. |
| [`tags`](#parameter-tags) | object | Endpoint tags. |

### Parameter: `afdEndpoints`

Array of AFD endpoint objects.
- Required: No
- Type: array
- Default: `[]`

### Parameter: `customDomains`

Array of custom domain objects.
- Required: No
- Type: array
- Default: `[]`

### Parameter: `enableDefaultTelemetry`

Enable telemetry via a Globally Unique Identifier (GUID).
- Required: No
- Type: bool
- Default: `True`

### Parameter: `endpointName`

Name of the endpoint under the profile which is unique globally.
- Required: No
- Type: string
- Default: `''`

### Parameter: `endpointProperties`

Endpoint properties (see https://learn.microsoft.com/en-us/azure/templates/microsoft.cdn/profiles/endpoints?pivots=deployment-language-bicep#endpointproperties for details).
- Required: No
- Type: object
- Default: `{}`

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

### Parameter: `name`

Name of the CDN profile.
- Required: Yes
- Type: string

### Parameter: `originResponseTimeoutSeconds`

Send and receive timeout on forwarding request to the origin.
- Required: No
- Type: int
- Default: `60`

### Parameter: `origionGroups`

Array of origin group objects. Required if the afdEndpoints is specified.
- Required: No
- Type: array
- Default: `[]`

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

### Parameter: `ruleSets`

Array of rule set objects.
- Required: No
- Type: array
- Default: `[]`

### Parameter: `secrets`

Array of secret objects.
- Required: No
- Type: array
- Default: `[]`

### Parameter: `sku`

The pricing tier (defines a CDN provider, feature list and rate) of the CDN profile.
- Required: Yes
- Type: string
- Allowed:
  ```Bicep
  [
    'Custom_Verizon'
    'Premium_AzureFrontDoor'
    'Premium_Verizon'
    'Standard_955BandWidth_ChinaCdn'
    'Standard_Akamai'
    'Standard_AvgBandWidth_ChinaCdn'
    'Standard_AzureFrontDoor'
    'Standard_ChinaCdn'
    'Standard_Microsoft'
    'Standard_Verizon'
    'StandardPlus_955BandWidth_ChinaCdn'
    'StandardPlus_AvgBandWidth_ChinaCdn'
    'StandardPlus_ChinaCdn'
  ]
  ```

### Parameter: `tags`

Endpoint tags.
- Required: No
- Type: object


## Outputs

| Output | Type | Description |
| :-- | :-- | :-- |
| `location` | string | The location the resource was deployed into. |
| `name` | string | The name of the CDN profile. |
| `profileType` | string | The type of the CDN profile. |
| `resourceGroupName` | string | The resource group where the CDN profile is deployed. |
| `resourceId` | string | The resource ID of the CDN profile. |

## Cross-referenced modules

_None_
