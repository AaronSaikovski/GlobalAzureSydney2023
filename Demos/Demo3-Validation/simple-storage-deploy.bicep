@description('Storage Account type')
@allowed([
  'Premium_LRS'
  'Premium_ZRS'
  'Standard_GRS'
  'Standard_GZRS'
  'Standard_LRS'
  'Standard_RAGRS'
  'Standard_RAGZRS'
  'Standard_ZRS'
])
param storageAccountType string = 'Standard_LRS'


@description('Location for all resources.')
param location string = resourceGroup().location

@description('The name of the Storage Account')
param storageAccountName string = 'stg${uniqueString(resourceGroup().id)}'


// @description('Optional. Dynamically tags from JSON file')
// var tags = json(loadTextContent('./tags.json'))

resource storageAccountName_resource 'Microsoft.Storage/storageAccounts@2021-06-01' = {
  name: storageAccountName
  location: location
  //tags:resourceGroup().tags
  sku: {
    name: storageAccountType
  }
  kind: 'StorageV2'
  properties: {}
}

output storageAccountName string = storageAccountName
output storageAccountId string = storageAccountName_resource.id

