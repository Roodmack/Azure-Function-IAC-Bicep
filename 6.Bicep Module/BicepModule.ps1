
# Create Resource Group Script

# This Script will deploy an App service Plan or Serverfarm, App Serviceor  Web App, sql server and Database + Writelisting ip, Application Insight to Dev QA Prod 
Set-Location "C:\Users\Roodmack\Desktop\Azure Function\Bicep\05 Azure World Practice/6.Bicep Module"
# Deploy to Dev
New-AzResourceGroupDeployment -ResourceGroupName 'azr-rg-bicep-dev'  -Name 'BicepCoursDeply' -Mode "Incremental"  -TemplateFile .\0.main.bicep -TemplateParameterFile .\0.main_dev.bicepparam
# Deploy Qa
New-AzResourceGroupDeployment -ResourceGroupName 'azr-rg-bicep-qa'  -Name 'BicepCoursDeply' -Mode "Incremental"  -TemplateFile .\0.main.bicep -TemplateParameterFile .\0.main_qa.bicepparam
# Deploy Prod
New-AzResourceGroupDeployment -ResourceGroupName 'azr-rg-bicep-prod'  -Name 'BicepCoursDeply' -Mode "Incremental"  -TemplateFile .\0.main.bicep -TemplateParameterFile .\0.main_prod.bicepparam






# Create Resource Group
New-AzSubscriptionDeployment -Name 'resourcegroupBicep' -Location 'East US' -TemplateFile .\3.resourcegroup.bicep -pResourceGroupName 'azr-rg-bicep' 