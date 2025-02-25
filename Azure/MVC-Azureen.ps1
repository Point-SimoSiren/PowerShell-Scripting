
### Tämä käyttää PowerShellin Azure moduulia, ei Azure CLI:tä ###

### Tällä Scriptillä voi luoda Azureen App servicen joka hakee lähdekoodin GitHubista ###

# Perustuu PowerShellin dokumentaation esimerkkiin joka haki MVC esimerkki sovelluksen jostain
# tutoriaalille omistetusta reposta ja oli tehty classisella MVC:llä (ei corella)

### Yhdistäminen Azureen ###
Connect-AzAccount

# Muuttujia
$gitrepo="https://github.com/Point-SimoSiren/Core-MVC-Az-Julkaisuun.git"
$webappname="mvcjulkaisu555" #nimi pitää olla uniikki, joten vaihda
$location="West Europe"

# Resource groupin luonti jos tarvitsee, tai muuten seuravassa komennossa annettava sen nimi
# ja tämä kommentoida pois
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
Set-AzResource -Properties $PropertiesObject -ResourceGroupName myResourceGroup -ResourceType Microsoft.Web/sites/sourcecontrols -ResourceName $webappname/web -ApiVersion 2023-12-01 -Force