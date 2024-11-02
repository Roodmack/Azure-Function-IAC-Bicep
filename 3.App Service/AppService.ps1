
# Create Resource Group Script

# This Script will deploy an App service Plan , Serverfarm and App Service, Web App
Set-Location "C:\Users\Roodmack\Desktop\Azure Function\Bicep\05 Azure World Practice\3.App Service"
New-AzResourceGroupDeployment -ResourceGroupName 'azr_rs_group'  -Name 'AppServicePlan' -Mode "Incremental"  -TemplateFile  .\AppService.bicep #-confirm -whatif