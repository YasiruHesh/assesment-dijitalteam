
resource hostingPlan 'Microsoft.Web/serverfarms@2021-02-01' existing = {
  name: 'your-hosting-plan-name'
}

module webAppModule 'webApp.bicep' = {
  name: 'webAppDeployment'
  params: {
    hostingPlanId: hostingPlan.id
    timezone: 'Brisbane'
  }
}

resource webApp1 'Microsoft.Web/sites@2021-02-01' = {
  name: 'webApp1'
  location: 'your-location'
  properties: {
    serverFarmId: hostingPlan.id
    siteConfig: {
      timeZone: 'Brisbane'
    }
  }
}

resource webApp2 'Microsoft.Web/sites@2021-02-01' = {
  name: 'webApp2'
  location: 'your-location'
  properties: {
    serverFarmId: hostingPlan.id
  }
}

resource webApp3 'Microsoft.Web/sites@2021-02-01' = {
  name: 'webApp3'
  location: 'your-location'
  properties: {
    serverFarmId: hostingPlan.id
  }
}
