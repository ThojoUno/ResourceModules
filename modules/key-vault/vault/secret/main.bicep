metadata name = 'Key Vault Secrets'
metadata description = 'This module deploys a Key Vault Secret.'
metadata owner = 'Azure/module-maintainers'

@description('Conditional. The name of the parent key vault. Required if the template is used in a standalone deployment.')
param keyVaultName string

@description('Required. The name of the secret.')
param name string

@description('Optional. Resource tags.')
param tags object?

@description('Optional. Determines whether the object is enabled.')
param attributesEnabled bool = true

@description('Optional. Expiry date in seconds since 1970-01-01T00:00:00Z. For security reasons, it is recommended to set an expiration date whenever possible.')
param attributesExp int = -1

@description('Optional. Not before date in seconds since 1970-01-01T00:00:00Z.')
param attributesNbf int = -1

@description('Optional. The content type of the secret.')
@secure()
param contentType string = ''

@description('Required. The value of the secret. NOTE: "value" will never be returned from the service, as APIs using this model are is intended for internal use in ARM deployments. Users should use the data-plane REST service for interaction with vault secrets.')
@secure()
param value string

@description('Optional. Enable telemetry via a Globally Unique Identifier (GUID).')
param enableDefaultTelemetry bool = true

@description('Optional. Array of role assignment objects that contain the \'roleDefinitionIdOrName\' and \'principalId\' to define RBAC role assignments on this resource. In the roleDefinitionIdOrName attribute, you can provide either the display name of the role definition, or its fully qualified ID in the following format: \'/providers/Microsoft.Authorization/roleDefinitions/c2f4ef07-c644-48eb-af81-4b1b4947fb11\'.')
param roleAssignments roleAssignmentType

var builtInRoleNames = {
  Contributor: subscriptionResourceId('Microsoft.Authorization/roleDefinitions', 'b24988ac-6180-42a0-ab88-20f7382dd24c')
  'Key Vault Administrator': subscriptionResourceId('Microsoft.Authorization/roleDefinitions', '00482a5a-887f-4fb3-b363-3b7fe8e74483')
  'Key Vault Certificates Officer': subscriptionResourceId('Microsoft.Authorization/roleDefinitions', 'a4417e6f-fecd-4de8-b567-7b0420556985')
  'Key Vault Contributor': subscriptionResourceId('Microsoft.Authorization/roleDefinitions', 'f25e0fa2-a7c8-4377-a976-54943a77a395')
  'Key Vault Crypto Officer': subscriptionResourceId('Microsoft.Authorization/roleDefinitions', '14b46e9e-c2b7-41b4-b07b-48a6ebf60603')
  'Key Vault Crypto Service Encryption User': subscriptionResourceId('Microsoft.Authorization/roleDefinitions', 'e147488a-f6f5-4113-8e2d-b22465e65bf6')
  'Key Vault Crypto User': subscriptionResourceId('Microsoft.Authorization/roleDefinitions', '12338af0-0e69-4776-bea7-57ae8d297424')
  'Key Vault Reader': subscriptionResourceId('Microsoft.Authorization/roleDefinitions', '21090545-7ca7-4776-b22c-e363652d74d2')
  'Key Vault Secrets Officer': subscriptionResourceId('Microsoft.Authorization/roleDefinitions', 'b86a8fe4-44ce-4948-aee5-eccb2c155cd7')
  'Key Vault Secrets User': subscriptionResourceId('Microsoft.Authorization/roleDefinitions', '4633458b-17de-408a-b874-0445c86b69e6')
  Owner: subscriptionResourceId('Microsoft.Authorization/roleDefinitions', '8e3af657-a8ff-443c-a75c-2fe8c4bcb635')
  Reader: subscriptionResourceId('Microsoft.Authorization/roleDefinitions', 'acdd72a7-3385-48ef-bd42-f606fba81ae7')
  'Role Based Access Control Administrator (Preview)': subscriptionResourceId('Microsoft.Authorization/roleDefinitions', 'f58310d9-a9f6-439a-9e8d-f62e7b41a168')
  'User Access Administrator': subscriptionResourceId('Microsoft.Authorization/roleDefinitions', '18d7d88d-d35e-4fb5-a5c3-7773c20a72d9')
}

resource defaultTelemetry 'Microsoft.Resources/deployments@2021-04-01' = if (enableDefaultTelemetry) {
  name: 'pid-47ed15a6-730a-4827-bcb4-0fd963ffbd82-${uniqueString(deployment().name)}'
  properties: {
    mode: 'Incremental'
    template: {
      '$schema': 'https://schema.management.azure.com/schemas/2019-04-01/deploymentTemplate.json#'
      contentVersion: '1.0.0.0'
      resources: []
    }
  }
}

resource keyVault 'Microsoft.KeyVault/vaults@2022-07-01' existing = {
  name: keyVaultName
}

resource secret 'Microsoft.KeyVault/vaults/secrets@2022-07-01' = {
  name: name
  parent: keyVault
  tags: tags
  properties: {
    contentType: contentType
    attributes: {
      enabled: attributesEnabled
      exp: attributesExp != -1 ? attributesExp : null
      nbf: attributesNbf != -1 ? attributesNbf : null
    }
    value: value
  }
}

resource secret_roleAssignments 'Microsoft.Authorization/roleAssignments@2022-04-01' = [for (roleAssignment, index) in (roleAssignments ?? []): {
  name: guid(secret.id, roleAssignment.principalId, roleAssignment.roleDefinitionIdOrName)
  properties: {
    roleDefinitionId: contains(builtInRoleNames, roleAssignment.roleDefinitionIdOrName) ? builtInRoleNames[roleAssignment.roleDefinitionIdOrName] : roleAssignment.roleDefinitionIdOrName
    principalId: roleAssignment.principalId
    description: roleAssignment.?description
    principalType: roleAssignment.?principalType
    condition: roleAssignment.?condition
    conditionVersion: !empty(roleAssignment.?condition) ? (roleAssignment.?conditionVersion ?? '2.0') : null // Must only be set if condtion is set
    delegatedManagedIdentityResourceId: roleAssignment.?delegatedManagedIdentityResourceId
  }
  scope: secret
}]

@description('The name of the secret.')
output name string = secret.name

@description('The resource ID of the secret.')
output resourceId string = secret.id

@description('The name of the resource group the secret was created in.')
output resourceGroupName string = resourceGroup().name

// =============== //
//   Definitions   //
// =============== //

type roleAssignmentType = {
  @description('Required. The name of the role to assign. If it cannot be found you can specify the role definition ID instead.')
  roleDefinitionIdOrName: string

  @description('Required. The principal ID of the principal (user/group/identity) to assign the role to.')
  principalId: string

  @description('Optional. The principal type of the assigned principal ID.')
  principalType: ('ServicePrincipal' | 'Group' | 'User' | 'ForeignGroup' | 'Device' | null)?

  @description('Optional. The description of the role assignment.')
  description: string?

  @description('Optional. The conditions on the role assignment. This limits the resources it can be assigned to. e.g.: @Resource[Microsoft.Storage/storageAccounts/blobServices/containers:ContainerName] StringEqualsIgnoreCase "foo_storage_container"')
  condition: string?

  @description('Optional. Version of the condition.')
  conditionVersion: '2.0'?

  @description('Optional. The Resource Id of the delegated managed identity resource.')
  delegatedManagedIdentityResourceId: string?
}[]?
