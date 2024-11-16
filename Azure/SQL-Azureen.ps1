
### Tämä scripti luo Azureen ResourceGroupin ja sinne SQL serverin ja tietokannan ###

# Rivit on pitkiä. Jos haluaa rivinvaihtoja koodin luettavuutta varten,
# niissä pitää käyttää tiettyä merkkiä.
# Mutta tietokoneen kannalta pitkät rivit ei haittaa, ehkä päinvastoin ennemminkin.

### Yhdistä Azureen ###
Connect-AzAccount

### Muuttujien asettaminen ###
# Anna sopivat arvot näihin kaikkiin
$resourceGroupName = "SQLazRG"
# Get-AzLocation #Listaa eri sijainnit. Alla on West USA, mikä sekin on ihan ok
$location = "westus2"
$serverName = "LuotavanServerinNimi"
$adminSqlLogin = "SqlAdmin"
$password = "SopivaSalana"
$databaseName = "minundb"

### Luodaan uusi Resource Group ###
# Jos on olemassa ennetään sopiva niin annetaan sen nimi ja sijainti kahdessa
# viimeisimmässä kohdassa
New-AzResourceGroup -Name $resourceGroupName -Location $location

### Luodaan uusi SQL Server Azureen ###
New-AzSqlServer -ResourceGroupName $resourceGroupName -ServerName $serverName -Location $location -SqlAdministratorCredentials (New-AzSqlAdministratorCredentials -SqlAdministratorLogin $adminSqlLogin -Password $password)

### Luodaan em. SQL serveriin tietokanta joka on n. 4,5 €/kk (basic tier) ###
New-AzSqlDatabase -ResourceGroupName $resourceGroupName -ServerName $serverName -DatabaseName $databaseName -Edition "Basic" -RequestedServiceObjectiveName "Basic"