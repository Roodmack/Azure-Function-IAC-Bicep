
# Create Resource Group Script

Set-Location "C:\Users\Roodmack\Desktop\Azure Function\Bicep\05 Azure World Practice\2.App Service Plan"
New-AzResourceGroupDeployment -ResourceGroupName 'azr_rs_group'  -Name 'AppServicePlan' -Mode "Incremental"  -TemplateFile .\AppServicePlan.bicep 