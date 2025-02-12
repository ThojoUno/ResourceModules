# Service Fabric Clusters `[Microsoft.ServiceFabric/clusters]`

This module deploys a Service Fabric Cluster.

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
| `Microsoft.ServiceFabric/clusters` | [2021-06-01](https://learn.microsoft.com/en-us/azure/templates/Microsoft.ServiceFabric/2021-06-01/clusters) |
| `Microsoft.ServiceFabric/clusters/applicationTypes` | [2021-06-01](https://learn.microsoft.com/en-us/azure/templates/Microsoft.ServiceFabric/2021-06-01/clusters/applicationTypes) |

## Usage examples

The following section provides usage examples for the module, which were used to validate and deploy the module successfully. For a full reference, please review the module's test folder in its repository.

>**Note**: Each example lists all the required parameters first, followed by the rest - each in alphabetical order.

>**Note**: To reference the module, please use the following syntax `br:bicep/modules/service-fabric.cluster:1.0.0`.

- [Cert](#example-1-cert)
- [Using only defaults](#example-2-using-only-defaults)
- [Using large parameter set](#example-3-using-large-parameter-set)

### Example 1: _Cert_

<details>

<summary>via Bicep module</summary>

```bicep
module cluster 'br:bicep/modules/service-fabric.cluster:1.0.0' = {
  name: '${uniqueString(deployment().name, location)}-test-sfccer'
  params: {
    // Required parameters
    managementEndpoint: 'https://sfccer001.westeurope.cloudapp.azure.com:19080'
    name: 'sfccer001'
    nodeTypes: [
      {
        applicationPorts: {
          endPort: 30000
          startPort: 20000
        }
        clientConnectionEndpointPort: 19000
        durabilityLevel: 'Bronze'
        ephemeralPorts: {
          endPort: 65534
          startPort: 49152
        }
        httpGatewayEndpointPort: 19080
        isPrimary: true
        name: 'Node01'
      }
    ]
    reliabilityLevel: 'None'
    // Non-required parameters
    certificate: {
      thumbprint: '0AC113D5E1D94C401DDEB0EE2B1B96CC130'
      x509StoreName: 'My'
    }
    enableDefaultTelemetry: '<enableDefaultTelemetry>'
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
    "managementEndpoint": {
      "value": "https://sfccer001.westeurope.cloudapp.azure.com:19080"
    },
    "name": {
      "value": "sfccer001"
    },
    "nodeTypes": {
      "value": [
        {
          "applicationPorts": {
            "endPort": 30000,
            "startPort": 20000
          },
          "clientConnectionEndpointPort": 19000,
          "durabilityLevel": "Bronze",
          "ephemeralPorts": {
            "endPort": 65534,
            "startPort": 49152
          },
          "httpGatewayEndpointPort": 19080,
          "isPrimary": true,
          "name": "Node01"
        }
      ]
    },
    "reliabilityLevel": {
      "value": "None"
    },
    // Non-required parameters
    "certificate": {
      "value": {
        "thumbprint": "0AC113D5E1D94C401DDEB0EE2B1B96CC130",
        "x509StoreName": "My"
      }
    },
    "enableDefaultTelemetry": {
      "value": "<enableDefaultTelemetry>"
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

### Example 2: _Using only defaults_

This instance deploys the module with the minimum set of required parameters.


<details>

<summary>via Bicep module</summary>

```bicep
module cluster 'br:bicep/modules/service-fabric.cluster:1.0.0' = {
  name: '${uniqueString(deployment().name, location)}-test-sfcmin'
  params: {
    // Required parameters
    managementEndpoint: 'https://sfcmin001.westeurope.cloudapp.azure.com:19080'
    name: 'sfcmin001'
    nodeTypes: [
      {
        applicationPorts: {
          endPort: 30000
          startPort: 20000
        }
        clientConnectionEndpointPort: 19000
        durabilityLevel: 'Bronze'
        ephemeralPorts: {
          endPort: 65534
          startPort: 49152
        }
        httpGatewayEndpointPort: 19080
        isPrimary: true
        name: 'Node01'
      }
    ]
    reliabilityLevel: 'None'
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
    "managementEndpoint": {
      "value": "https://sfcmin001.westeurope.cloudapp.azure.com:19080"
    },
    "name": {
      "value": "sfcmin001"
    },
    "nodeTypes": {
      "value": [
        {
          "applicationPorts": {
            "endPort": 30000,
            "startPort": 20000
          },
          "clientConnectionEndpointPort": 19000,
          "durabilityLevel": "Bronze",
          "ephemeralPorts": {
            "endPort": 65534,
            "startPort": 49152
          },
          "httpGatewayEndpointPort": 19080,
          "isPrimary": true,
          "name": "Node01"
        }
      ]
    },
    "reliabilityLevel": {
      "value": "None"
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

### Example 3: _Using large parameter set_

This instance deploys the module with most of its features enabled.


<details>

<summary>via Bicep module</summary>

```bicep
module cluster 'br:bicep/modules/service-fabric.cluster:1.0.0' = {
  name: '${uniqueString(deployment().name, location)}-test-sfcmax'
  params: {
    // Required parameters
    managementEndpoint: 'https://sfcmax001.westeurope.cloudapp.azure.com:19080'
    name: 'sfcmax001'
    nodeTypes: [
      {
        applicationPorts: {
          endPort: 30000
          startPort: 20000
        }
        clientConnectionEndpointPort: 19000
        durabilityLevel: 'Silver'
        ephemeralPorts: {
          endPort: 65534
          startPort: 49152
        }
        httpGatewayEndpointPort: 19080
        isPrimary: true
        isStateless: false
        multipleAvailabilityZones: false
        name: 'Node01'
        placementProperties: {}
        reverseProxyEndpointPort: ''
        vmInstanceCount: 5
      }
      {
        applicationPorts: {
          endPort: 30000
          startPort: 20000
        }
        clientConnectionEndpointPort: 19000
        durabilityLevel: 'Bronze'
        ephemeralPorts: {
          endPort: 64000
          httpGatewayEndpointPort: 19007
          isPrimary: true
          name: 'Node02'
          startPort: 49000
          vmInstanceCount: 5
        }
      }
    ]
    reliabilityLevel: 'Silver'
    // Non-required parameters
    addOnFeatures: [
      'BackupRestoreService'
      'DnsService'
      'RepairManager'
      'ResourceMonitorService'
    ]
    applicationTypes: [
      {
        name: 'WordCount'
      }
    ]
    azureActiveDirectory: {
      clientApplication: '<clientApplication>'
      clusterApplication: 'cf33fea8-b30f-424f-ab73-c48d99e0b222'
      tenantId: '<tenantId>'
    }
    certificateCommonNames: {
      commonNames: [
        {
          certificateCommonName: 'certcommon'
          certificateIssuerThumbprint: '0AC113D5E1D94C401DDEB0EE2B1B96CC130'
        }
      ]
      x509StoreName: ''
    }
    clientCertificateCommonNames: [
      {
        certificateCommonName: 'clientcommoncert1'
        certificateIssuerThumbprint: '0AC113D5E1D94C401DDEB0EE2B1B96CC130'
        isAdmin: false
      }
      {
        certificateCommonName: 'clientcommoncert2'
        certificateIssuerThumbprint: '0AC113D5E1D94C401DDEB0EE2B1B96CC131'
        isAdmin: false
      }
    ]
    clientCertificateThumbprints: [
      {
        certificateThumbprint: '0AC113D5E1D94C401DDEB0EE2B1B96CC130'
        isAdmin: false
      }
      {
        certificateThumbprint: '0AC113D5E1D94C401DDEB0EE2B1B96CC131'
        isAdmin: false
      }
    ]
    diagnosticsStorageAccountConfig: {
      blobEndpoint: '<blobEndpoint>'
      protectedAccountKeyName: 'StorageAccountKey1'
      queueEndpoint: '<queueEndpoint>'
      storageAccountName: '<storageAccountName>'
      tableEndpoint: '<tableEndpoint>'
    }
    enableDefaultTelemetry: '<enableDefaultTelemetry>'
    fabricSettings: [
      {
        name: 'Security'
        parameters: [
          {
            name: 'ClusterProtectionLevel'
            value: 'EncryptAndSign'
          }
        ]
      }
      {
        name: 'UpgradeService'
        parameters: [
          {
            name: 'AppPollIntervalInSeconds'
            value: '60'
          }
        ]
      }
    ]
    lock: {
      kind: 'CanNotDelete'
      name: 'myCustomLockName'
    }
    maxUnusedVersionsToKeep: 2
    notifications: [
      {
        isEnabled: true
        notificationCategory: 'WaveProgress'
        notificationLevel: 'Critical'
        notificationTargets: [
          {
            notificationChannel: 'EmailUser'
            receivers: [
              'SomeReceiver'
            ]
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
    tags: {
      clusterName: 'sfcmax001'
      'hidden-title': 'This is visible in the resource name'
      resourceType: 'Service Fabric'
    }
    upgradeDescription: {
      deltaHealthPolicy: {
        maxPercentDeltaUnhealthyApplications: 0
        maxPercentDeltaUnhealthyNodes: 0
        maxPercentUpgradeDomainDeltaUnhealthyNodes: 0
      }
      forceRestart: false
      healthCheckRetryTimeout: '00:45:00'
      healthCheckStableDuration: '00:01:00'
      healthCheckWaitDuration: '00:00:30'
      healthPolicy: {
        maxPercentUnhealthyApplications: 0
        maxPercentUnhealthyNodes: 0
      }
      upgradeDomainTimeout: '02:00:00'
      upgradeReplicaSetCheckTimeout: '1.00:00:00'
      upgradeTimeout: '02:00:00'
    }
    vmImage: 'Linux'
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
    "managementEndpoint": {
      "value": "https://sfcmax001.westeurope.cloudapp.azure.com:19080"
    },
    "name": {
      "value": "sfcmax001"
    },
    "nodeTypes": {
      "value": [
        {
          "applicationPorts": {
            "endPort": 30000,
            "startPort": 20000
          },
          "clientConnectionEndpointPort": 19000,
          "durabilityLevel": "Silver",
          "ephemeralPorts": {
            "endPort": 65534,
            "startPort": 49152
          },
          "httpGatewayEndpointPort": 19080,
          "isPrimary": true,
          "isStateless": false,
          "multipleAvailabilityZones": false,
          "name": "Node01",
          "placementProperties": {},
          "reverseProxyEndpointPort": "",
          "vmInstanceCount": 5
        },
        {
          "applicationPorts": {
            "endPort": 30000,
            "startPort": 20000
          },
          "clientConnectionEndpointPort": 19000,
          "durabilityLevel": "Bronze",
          "ephemeralPorts": {
            "endPort": 64000,
            "httpGatewayEndpointPort": 19007,
            "isPrimary": true,
            "name": "Node02",
            "startPort": 49000,
            "vmInstanceCount": 5
          }
        }
      ]
    },
    "reliabilityLevel": {
      "value": "Silver"
    },
    // Non-required parameters
    "addOnFeatures": {
      "value": [
        "BackupRestoreService",
        "DnsService",
        "RepairManager",
        "ResourceMonitorService"
      ]
    },
    "applicationTypes": {
      "value": [
        {
          "name": "WordCount"
        }
      ]
    },
    "azureActiveDirectory": {
      "value": {
        "clientApplication": "<clientApplication>",
        "clusterApplication": "cf33fea8-b30f-424f-ab73-c48d99e0b222",
        "tenantId": "<tenantId>"
      }
    },
    "certificateCommonNames": {
      "value": {
        "commonNames": [
          {
            "certificateCommonName": "certcommon",
            "certificateIssuerThumbprint": "0AC113D5E1D94C401DDEB0EE2B1B96CC130"
          }
        ],
        "x509StoreName": ""
      }
    },
    "clientCertificateCommonNames": {
      "value": [
        {
          "certificateCommonName": "clientcommoncert1",
          "certificateIssuerThumbprint": "0AC113D5E1D94C401DDEB0EE2B1B96CC130",
          "isAdmin": false
        },
        {
          "certificateCommonName": "clientcommoncert2",
          "certificateIssuerThumbprint": "0AC113D5E1D94C401DDEB0EE2B1B96CC131",
          "isAdmin": false
        }
      ]
    },
    "clientCertificateThumbprints": {
      "value": [
        {
          "certificateThumbprint": "0AC113D5E1D94C401DDEB0EE2B1B96CC130",
          "isAdmin": false
        },
        {
          "certificateThumbprint": "0AC113D5E1D94C401DDEB0EE2B1B96CC131",
          "isAdmin": false
        }
      ]
    },
    "diagnosticsStorageAccountConfig": {
      "value": {
        "blobEndpoint": "<blobEndpoint>",
        "protectedAccountKeyName": "StorageAccountKey1",
        "queueEndpoint": "<queueEndpoint>",
        "storageAccountName": "<storageAccountName>",
        "tableEndpoint": "<tableEndpoint>"
      }
    },
    "enableDefaultTelemetry": {
      "value": "<enableDefaultTelemetry>"
    },
    "fabricSettings": {
      "value": [
        {
          "name": "Security",
          "parameters": [
            {
              "name": "ClusterProtectionLevel",
              "value": "EncryptAndSign"
            }
          ]
        },
        {
          "name": "UpgradeService",
          "parameters": [
            {
              "name": "AppPollIntervalInSeconds",
              "value": "60"
            }
          ]
        }
      ]
    },
    "lock": {
      "value": {
        "kind": "CanNotDelete",
        "name": "myCustomLockName"
      }
    },
    "maxUnusedVersionsToKeep": {
      "value": 2
    },
    "notifications": {
      "value": [
        {
          "isEnabled": true,
          "notificationCategory": "WaveProgress",
          "notificationLevel": "Critical",
          "notificationTargets": [
            {
              "notificationChannel": "EmailUser",
              "receivers": [
                "SomeReceiver"
              ]
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
    "tags": {
      "value": {
        "clusterName": "sfcmax001",
        "hidden-title": "This is visible in the resource name",
        "resourceType": "Service Fabric"
      }
    },
    "upgradeDescription": {
      "value": {
        "deltaHealthPolicy": {
          "maxPercentDeltaUnhealthyApplications": 0,
          "maxPercentDeltaUnhealthyNodes": 0,
          "maxPercentUpgradeDomainDeltaUnhealthyNodes": 0
        },
        "forceRestart": false,
        "healthCheckRetryTimeout": "00:45:00",
        "healthCheckStableDuration": "00:01:00",
        "healthCheckWaitDuration": "00:00:30",
        "healthPolicy": {
          "maxPercentUnhealthyApplications": 0,
          "maxPercentUnhealthyNodes": 0
        },
        "upgradeDomainTimeout": "02:00:00",
        "upgradeReplicaSetCheckTimeout": "1.00:00:00",
        "upgradeTimeout": "02:00:00"
      }
    },
    "vmImage": {
      "value": "Linux"
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
| [`managementEndpoint`](#parameter-managementendpoint) | string | The http management endpoint of the cluster. |
| [`name`](#parameter-name) | string | Name of the Service Fabric cluster. |
| [`nodeTypes`](#parameter-nodetypes) | array | The list of node types in the cluster. |
| [`reliabilityLevel`](#parameter-reliabilitylevel) | string | The reliability level sets the replica set size of system services. Learn about ReliabilityLevel (https://learn.microsoft.com/en-us/azure/service-fabric/service-fabric-cluster-capacity). - None - Run the System services with a target replica set count of 1. This should only be used for test clusters. - Bronze - Run the System services with a target replica set count of 3. This should only be used for test clusters. - Silver - Run the System services with a target replica set count of 5. - Gold - Run the System services with a target replica set count of 7. - Platinum - Run the System services with a target replica set count of 9. |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`addOnFeatures`](#parameter-addonfeatures) | array | The list of add-on features to enable in the cluster. |
| [`applicationTypes`](#parameter-applicationtypes) | array | Array of Service Fabric cluster application types. |
| [`azureActiveDirectory`](#parameter-azureactivedirectory) | object | The settings to enable AAD authentication on the cluster. |
| [`certificate`](#parameter-certificate) | object | Describes the certificate details like thumbprint of the primary certificate, thumbprint of the secondary certificate and the local certificate store location. |
| [`certificateCommonNames`](#parameter-certificatecommonnames) | object | Describes a list of server certificates referenced by common name that are used to secure the cluster. |
| [`clientCertificateCommonNames`](#parameter-clientcertificatecommonnames) | array | The list of client certificates referenced by common name that are allowed to manage the cluster. |
| [`clientCertificateThumbprints`](#parameter-clientcertificatethumbprints) | array | The list of client certificates referenced by thumbprint that are allowed to manage the cluster. |
| [`clusterCodeVersion`](#parameter-clustercodeversion) | string | The Service Fabric runtime version of the cluster. This property can only by set the user when upgradeMode is set to "Manual". To get list of available Service Fabric versions for new clusters use ClusterVersion API. To get the list of available version for existing clusters use availableClusterVersions. |
| [`diagnosticsStorageAccountConfig`](#parameter-diagnosticsstorageaccountconfig) | object | The storage account information for storing Service Fabric diagnostic logs. |
| [`enableDefaultTelemetry`](#parameter-enabledefaulttelemetry) | bool | Enable telemetry via a Globally Unique Identifier (GUID). |
| [`eventStoreServiceEnabled`](#parameter-eventstoreserviceenabled) | bool | Indicates if the event store service is enabled. |
| [`fabricSettings`](#parameter-fabricsettings) | array | The list of custom fabric settings to configure the cluster. |
| [`infrastructureServiceManager`](#parameter-infrastructureservicemanager) | bool | Indicates if infrastructure service manager is enabled. |
| [`location`](#parameter-location) | string | Location for all resources. |
| [`lock`](#parameter-lock) | object | The lock settings of the service. |
| [`maxUnusedVersionsToKeep`](#parameter-maxunusedversionstokeep) | int | Number of unused versions per application type to keep. |
| [`notifications`](#parameter-notifications) | array | Indicates a list of notification channels for cluster events. |
| [`reverseProxyCertificate`](#parameter-reverseproxycertificate) | object | Describes the certificate details. |
| [`reverseProxyCertificateCommonNames`](#parameter-reverseproxycertificatecommonnames) | object | Describes a list of server certificates referenced by common name that are used to secure the cluster. |
| [`roleAssignments`](#parameter-roleassignments) | array | Array of role assignment objects that contain the 'roleDefinitionIdOrName' and 'principalId' to define RBAC role assignments on this resource. In the roleDefinitionIdOrName attribute, you can provide either the display name of the role definition, or its fully qualified ID in the following format: '/providers/Microsoft.Authorization/roleDefinitions/c2f4ef07-c644-48eb-af81-4b1b4947fb11'. |
| [`sfZonalUpgradeMode`](#parameter-sfzonalupgrademode) | string | This property controls the logical grouping of VMs in upgrade domains (UDs). This property cannot be modified if a node type with multiple Availability Zones is already present in the cluster. |
| [`tags`](#parameter-tags) | object | Tags of the resource. |
| [`upgradeDescription`](#parameter-upgradedescription) | object | Describes the policy used when upgrading the cluster. |
| [`upgradeMode`](#parameter-upgrademode) | string | The upgrade mode of the cluster when new Service Fabric runtime version is available. |
| [`upgradePauseEndTimestampUtc`](#parameter-upgradepauseendtimestamputc) | string | Indicates the end date and time to pause automatic runtime version upgrades on the cluster for an specific period of time on the cluster (UTC). |
| [`upgradePauseStartTimestampUtc`](#parameter-upgradepausestarttimestamputc) | string | Indicates the start date and time to pause automatic runtime version upgrades on the cluster for an specific period of time on the cluster (UTC). |
| [`upgradeWave`](#parameter-upgradewave) | string | Indicates when new cluster runtime version upgrades will be applied after they are released. By default is Wave0. |
| [`vmImage`](#parameter-vmimage) | string | The VM image VMSS has been configured with. Generic names such as Windows or Linux can be used. |
| [`vmssZonalUpgradeMode`](#parameter-vmsszonalupgrademode) | string | This property defines the upgrade mode for the virtual machine scale set, it is mandatory if a node type with multiple Availability Zones is added. |
| [`waveUpgradePaused`](#parameter-waveupgradepaused) | bool | Boolean to pause automatic runtime version upgrades to the cluster. |

### Parameter: `addOnFeatures`

The list of add-on features to enable in the cluster.
- Required: No
- Type: array
- Default: `[]`
- Allowed:
  ```Bicep
  [
    'BackupRestoreService'
    'DnsService'
    'RepairManager'
    'ResourceMonitorService'
  ]
  ```

### Parameter: `applicationTypes`

Array of Service Fabric cluster application types.
- Required: No
- Type: array
- Default: `[]`

### Parameter: `azureActiveDirectory`

The settings to enable AAD authentication on the cluster.
- Required: No
- Type: object
- Default: `{}`

### Parameter: `certificate`

Describes the certificate details like thumbprint of the primary certificate, thumbprint of the secondary certificate and the local certificate store location.
- Required: No
- Type: object
- Default: `{}`

### Parameter: `certificateCommonNames`

Describes a list of server certificates referenced by common name that are used to secure the cluster.
- Required: No
- Type: object
- Default: `{}`

### Parameter: `clientCertificateCommonNames`

The list of client certificates referenced by common name that are allowed to manage the cluster.
- Required: No
- Type: array
- Default: `[]`

### Parameter: `clientCertificateThumbprints`

The list of client certificates referenced by thumbprint that are allowed to manage the cluster.
- Required: No
- Type: array
- Default: `[]`

### Parameter: `clusterCodeVersion`

The Service Fabric runtime version of the cluster. This property can only by set the user when upgradeMode is set to "Manual". To get list of available Service Fabric versions for new clusters use ClusterVersion API. To get the list of available version for existing clusters use availableClusterVersions.
- Required: No
- Type: string
- Default: `''`

### Parameter: `diagnosticsStorageAccountConfig`

The storage account information for storing Service Fabric diagnostic logs.
- Required: No
- Type: object
- Default: `{}`

### Parameter: `enableDefaultTelemetry`

Enable telemetry via a Globally Unique Identifier (GUID).
- Required: No
- Type: bool
- Default: `True`

### Parameter: `eventStoreServiceEnabled`

Indicates if the event store service is enabled.
- Required: No
- Type: bool
- Default: `False`

### Parameter: `fabricSettings`

The list of custom fabric settings to configure the cluster.
- Required: No
- Type: array
- Default: `[]`

### Parameter: `infrastructureServiceManager`

Indicates if infrastructure service manager is enabled.
- Required: No
- Type: bool
- Default: `False`

### Parameter: `location`

Location for all resources.
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

### Parameter: `managementEndpoint`

The http management endpoint of the cluster.
- Required: Yes
- Type: string

### Parameter: `maxUnusedVersionsToKeep`

Number of unused versions per application type to keep.
- Required: No
- Type: int
- Default: `3`

### Parameter: `name`

Name of the Service Fabric cluster.
- Required: Yes
- Type: string

### Parameter: `nodeTypes`

The list of node types in the cluster.
- Required: Yes
- Type: array

### Parameter: `notifications`

Indicates a list of notification channels for cluster events.
- Required: No
- Type: array
- Default: `[]`

### Parameter: `reliabilityLevel`

The reliability level sets the replica set size of system services. Learn about ReliabilityLevel (https://learn.microsoft.com/en-us/azure/service-fabric/service-fabric-cluster-capacity). - None - Run the System services with a target replica set count of 1. This should only be used for test clusters. - Bronze - Run the System services with a target replica set count of 3. This should only be used for test clusters. - Silver - Run the System services with a target replica set count of 5. - Gold - Run the System services with a target replica set count of 7. - Platinum - Run the System services with a target replica set count of 9.
- Required: Yes
- Type: string
- Allowed:
  ```Bicep
  [
    'Bronze'
    'Gold'
    'None'
    'Platinum'
    'Silver'
  ]
  ```

### Parameter: `reverseProxyCertificate`

Describes the certificate details.
- Required: No
- Type: object
- Default: `{}`

### Parameter: `reverseProxyCertificateCommonNames`

Describes a list of server certificates referenced by common name that are used to secure the cluster.
- Required: No
- Type: object
- Default: `{}`

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

### Parameter: `sfZonalUpgradeMode`

This property controls the logical grouping of VMs in upgrade domains (UDs). This property cannot be modified if a node type with multiple Availability Zones is already present in the cluster.
- Required: No
- Type: string
- Default: `'Hierarchical'`
- Allowed:
  ```Bicep
  [
    'Hierarchical'
    'Parallel'
  ]
  ```

### Parameter: `tags`

Tags of the resource.
- Required: No
- Type: object

### Parameter: `upgradeDescription`

Describes the policy used when upgrading the cluster.
- Required: No
- Type: object
- Default: `{}`

### Parameter: `upgradeMode`

The upgrade mode of the cluster when new Service Fabric runtime version is available.
- Required: No
- Type: string
- Default: `'Automatic'`
- Allowed:
  ```Bicep
  [
    'Automatic'
    'Manual'
  ]
  ```

### Parameter: `upgradePauseEndTimestampUtc`

Indicates the end date and time to pause automatic runtime version upgrades on the cluster for an specific period of time on the cluster (UTC).
- Required: No
- Type: string
- Default: `''`

### Parameter: `upgradePauseStartTimestampUtc`

Indicates the start date and time to pause automatic runtime version upgrades on the cluster for an specific period of time on the cluster (UTC).
- Required: No
- Type: string
- Default: `''`

### Parameter: `upgradeWave`

Indicates when new cluster runtime version upgrades will be applied after they are released. By default is Wave0.
- Required: No
- Type: string
- Default: `'Wave0'`
- Allowed:
  ```Bicep
  [
    'Wave0'
    'Wave1'
    'Wave2'
  ]
  ```

### Parameter: `vmImage`

The VM image VMSS has been configured with. Generic names such as Windows or Linux can be used.
- Required: No
- Type: string
- Default: `''`

### Parameter: `vmssZonalUpgradeMode`

This property defines the upgrade mode for the virtual machine scale set, it is mandatory if a node type with multiple Availability Zones is added.
- Required: No
- Type: string
- Default: `'Hierarchical'`
- Allowed:
  ```Bicep
  [
    'Hierarchical'
    'Parallel'
  ]
  ```

### Parameter: `waveUpgradePaused`

Boolean to pause automatic runtime version upgrades to the cluster.
- Required: No
- Type: bool
- Default: `False`


## Outputs

| Output | Type | Description |
| :-- | :-- | :-- |
| `endpoint` | string | The Service Fabric Cluster endpoint. |
| `location` | string | The location the resource was deployed into. |
| `name` | string | The Service Fabric Cluster name. |
| `resourceGroupName` | string | The Service Fabric Cluster resource group. |
| `resourceId` | string | The Service Fabric Cluster resource ID. |

## Cross-referenced modules

_None_

## Notes

### Parameter Usage: `notifications`

<details>

<summary>Parameter JSON format</summary>

```json
"notifications": {
    "value": [
        {
            "isEnabled": true, // Required. Indicates if the notification is enabled.
            "notificationCategory": "WaveProgress", // Required. The category of notification. Possible values include: "WaveProgress".
            "notificationLevel": "Critical", // Required. The level of notification. Possible values include: "Critical", "All".
            "notificationTargets": [
                {
                    "notificationChannel": "EmailUser", // Required. The notification channel indicates the type of receivers subscribed to the notification, either user or subscription. Possible values include: "EmailUser", "EmailSubscription".
                    "receivers": [
                        "SomeReceiver" // Required. List of targets that subscribe to the notification.
                    ]
                }
            ]
        }
    ]
}
```

</details>

<details>

<summary>Bicep format</summary>

```bicep
notifications: [
    {
        isEnabled: true // Required. Indicates if the notification is enabled.
        notificationCategory: 'WaveProgress' // Required. The category of notification. Possible values include: 'WaveProgress'.
        notificationLevel: 'Critical' // Required. The level of notification. Possible values include: 'Critical' 'All'.
        notificationTargets: [
            {
                notificationChannel: 'EmailUser' // Required. The notification channel indicates the type of receivers subscribed to the notification either user or subscription. Possible values include: 'EmailUser' 'EmailSubscription'.
                receivers: [
                    'SomeReceiver' // Required. List of targets that subscribe to the notification.
                ]
            }
        ]
    }
]
```

</details>
<p>
