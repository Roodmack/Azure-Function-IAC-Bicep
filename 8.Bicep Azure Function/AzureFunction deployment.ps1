
# Create Resource Group Script  if not exist
$getRGBicep=(Get-AzResourceGroup -Name '*azr-rg-bicep*')
if ($getRGBicep.Count -eq 0) {
    <# Action to perform if the condition is true #>
    # Create Resource Group
    Write-Host "No Resource Groups Found like '*azr-rg-bicep*', This Script will Create those Resource Groups now " -ForegroundColor Cyan
New-AzSubscriptionDeployment -Name 'resourcegroupBicep' -Location 'East US' -TemplateFile .\5.resourcegroup.bicep -pResourceGroupName 'azr-rg-bicep' 
}


$getRGBicep=(Get-AzResourceGroup -Name '*azr-rg-bicep*')
Write-Host "$($getRGBicep.Count) Resource Groups Found, Ready for deployment" -ForegroundColor Cyan


# This Script will deploy an App service Plan or Serverfarm, App Serviceor  Web App, sql server and Database + Writelisting ip, Application Insight to Dev QA Prod 
Set-Location "C:\Users\Roodmack\Desktop\Azure Function\Bicep\05 Azure World Practice\8.Bicep Azure Function"
# Deploy to Dev
New-AzResourceGroupDeployment -ResourceGroupName 'azr-rg-bicep-dev'  -Name 'BicepCoursDeply' -Mode "Incremental"  -TemplateFile .\0.main.bicep -TemplateParameterFile  .\0.mainDev.bicepparam
# Deploy Qa
New-AzResourceGroupDeployment -ResourceGroupName 'azr-rg-bicep-qa'  -Name 'BicepCoursDeply' -Mode "Incremental"  -TemplateFile .\0.main.bicep -TemplateParameterFile  .\0.mainQa.bicepparam
# Deploy Prod
New-AzResourceGroupDeployment -ResourceGroupName 'azr-rg-bicep-prod'  -Name 'BicepCoursDeply' -Mode "Incremental"  -TemplateFile .\0.main.bicep -TemplateParameterFile .\0.mainProd.bicepparam






# Remove Resource Group
$getRGBicep=(Get-AzResourceGroup -Name '*azr-rg-bicep*')
if ($getRGBicep.Count -gt 0){
$getRGBicep | Remove-AzResourceGroup -Force  
}
