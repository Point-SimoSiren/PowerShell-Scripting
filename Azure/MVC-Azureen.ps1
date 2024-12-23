
### Tämä käyttää PowerShellin Azure moduulia, ei Azure CLI:tä ###

### Tällä Scriptillä voi luoda Azureen App servicen joka hakee lähdekoodin GitHubista ###

# Perustuu PowerShellin dokumentaation esimerkkiin joka hakee MVC esimerkki sovelluksen jostain
# tutoriaalille omistetusta reposta

### Yhdistäminen Azureen ###
Connect-AzAccount

# Muuttujia
$gitrepo=""https://github.com/Point-SimoSiren/Core-MVC-Az-Julkaisuun.git
$webappname="esimerkkimvcappservice" #nimi pitää olla uniikki, joten vaihda
$location="West Europe"

# Resource groupin luonti
New-AzResourceGroup -Name myResourceGroup -Location $location

# Ilmainen plan
New-AzAppServicePlan -Name $webappname -Location $location -ResourceGroupName myResourceGroup -Tier Free

# Luo WebApp
New-AzWebApp -Name $webappname -Location $location -AppServicePlan $webappname -ResourceGroupName myResourceGroup

# Määritä github repo
$PropertiesObject = @{
    repoUrl = "$gitrepo";
    branch = "master";
    isManualIntegration = "true";
}
# Määritä asetukset
Set-AzResource -Properties $PropertiesObject -ResourceGroupName myResourceGroup -ResourceType Microsoft.Web/sites/sourcecontrols -ResourceName $webappname/web -ApiVersion 2015-08-01 -Force