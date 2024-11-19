
### Tällä Scriptillä voi luoda Azureen staattisen web sivuston ###

# Siinä saa olla HTML, CSS, BOOTSTRAP cdn viittaus, SELAIMESSA AJETTAVA FRONTTI JAVASCRIPT,
# mutta ei backendiä
# Soveltuu React fronttisovellukselle tai ihan perus www sivustolle

## Koodi haetaan GitHub repositoriosta ##

# Rivit on pitkiä. Jos haluaa rivinvaihtoja koodin luettavuutta varten,
# niissä pitää käyttää tiettyä merkkiä.
# Mutta tietokoneen kannalta pitkät rivit ei haittaa, ehkä päinvastoin ennemminkin.

### Yhdistäminen Azureen ###

Connect-AzAccount

### Asetetaan muuttujat ###

# Anna sopivat arvot kaikkiin
$resourceGroupName = "myResourceGroup"
# Get-AzLocation #Listaa eri sijainnit
$location = "northeurope"
$appName = "myStaticWebApp"
$githubRepo = "https://github.com/your-github-account/your-repo"
$branch = "main"

### Luodaan ResourceGroup ###
# Jos on olemassa ennetään sopiva niin annetaan sen nimi ja sijainti viimeisessä kohdassa.
New-AzResourceGroup -Name $resourceGroupName -Location $location

### Luodaan Static Web App ###
New-AzStaticWebApp -ResourceGroupName $resourceGroupName -Name $appName -Location $location -GithubAction -GithubToken (Get-AzAccessToken -ResourceUrl https://management.azure.com).Token -Repository $githubRepo -Branch $branch

