
# Create Resource Group Script
Set-Location 'C:\Users\Roodmack\Desktop\Azure Function\Bicep\05 Azure World Practice\1. Resource Group'
New-AzSubscriptionDeployment -Name 'rsbicep' -Location 'East US' -TemplateFile .\reourcegroup.bicep