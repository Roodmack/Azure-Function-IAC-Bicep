
# Create Resource Group Script

# This Script will deploy an App service Plan , Serverfarm and App Service, Web App, Application Insight
Set-Location "C:\Users\Roodmack\Desktop\Azure Function\Bicep\05 Azure World Practice\5.Azure SQL Database"
New-AzResourceGroupDeployment -ResourceGroupName 'azr_rs_group'  -Name 'AppServicePlan' -Mode "Incremental"  -TemplateFile   .\SQLDatabase.bicep