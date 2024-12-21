
### Tämä käyttää PowerShellin Azure moduulia, ei Azure CLI:tä ###

### Tämä scripti luo Azureen ResourceGroupin ja sinne SQL serverin ja tietokannan ###

### Yhdistä Azureen ###
Connect-AzAccount # Avautuu kirjautumisikkuna

### Muuttujien asettaminen ###
# Anna sopivat arvot näihin kaikkiin
$resourceGroupName = "JokuNimi"
# Get-AzLocation Listaa eri sijainnit tarvittaessa
$location = "northeurope"
$serverName = "luotavan_serverin_nimi"
$databaseName = "minundb"

### Luodaan uusi Resource Group ###
# Jos on olemassa ennetään sopiva niin annetaan sen nimi ja sijainti edellä,
# ja silloin ao. rivin voi kommentoida pois
New-AzResourceGroup -Name $resourceGroupName -Location $location

### Luodaan uusi SQL Server Azureen ###
# Luodaan ensin objekti, jossa on käyttäjätunnus ja salasana
$adminCreds = Get-Credential # dialogi boksi avautuu minne pääsee antamaan uudet tunnukset

# Sitten tulee varsinainen SQL serverin luontikomento
New-AzSqlServer -ResourceGroupName $resourceGroupName -ServerName $serverName -Location $location -SqlAdministratorCredentials $adminCreds 

# Lisätään oma ip azure sql palvelimen palomuuriin sallituksi
$myPublicIp = (Invoke-WebRequest -Uri "http://ifconfig.me/ip").Content.Trim()  # Haetaan oma public IP

New-AzSqlServerFirewallRule `
  -ResourceGroupName $resourceGroupName `
  -ServerName $serverName `
  -FirewallRuleName "AllowMyPublicIP" `
  -StartIpAddress $myPublicIp `
  -EndIpAddress $myPublicIp

# Sallitaan Azure palveluiden saada yhteys palomuurin puolesta (toki pitää olla connectionstring jne)
New-AzSqlServerFirewallRule -ResourceGroupName $resourceGroupName -ServerName $serverName -FirewallRuleName "AllowAzureServices" -StartIpAddress "0.0.0.0" -EndIpAddress "0.0.0.0"

### Luodaan em. SQL serveriin tietokanta joka on n. 4,5 €/kk (basic tier) ###
New-AzSqlDatabase -ResourceGroupName $resourceGroupName -ServerName $serverName -DatabaseName $databaseName -Edition "Basic" -RequestedServiceObjectiveName "Basic"