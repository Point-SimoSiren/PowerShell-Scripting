
## Sovelluksen käytössä ei ole hyvä pitää admin tasoista käyttäjää ##
## vaan luoda sitä varten käyttäjä jolla on vain ne oikeudet mitä ##
## sovellus tarvitsee ##

# Tämä scripti luo käyttäjän, jolla on read ja write oikeudet #

# PowerShell Az moduulia käyttävä scripti #
# Pitää olla asennettuna myös PowerShellin moduuli: SqlServer
# # # Install-Module -Name SqlServer -AllowClobber -Force

# Tämä skripti on Chat GPT:n luoma ja sen toiminta pitää vielä varmistaa #

# Muuttujien asettaminen
# Nämä voisi kysyä myös prompteilla tms.
$sqlServerName = "YourSqlServerName"          # Azure SQL Server nimi
$databaseName = "YourDatabaseName"            # Azure SQL Tietokanta nimi
$sqlAdminUsername = "YourSqlAdminUsername"    # SQL Palvelimen admin-käyttäjä
$sqlAdminPassword = "YourSqlAdminPassword"    # SQL Palvelimen admin-salasana
$appUserName = "YourAppUser"                  # Uuden käyttäjän nimi
$appUserPassword = "YourStrongPassword123!"   # Uuden käyttäjän salasana

Write-Host "Luodaan yhteys Azure SQL -palvelimeen..." -ForegroundColor Green

# Connection String
$sqlConnectionString = "Server=tcp:$sqlServerName.database.windows.net,1433;Initial Catalog=$databaseName;Persist Security Info=False;User ID=$sqlAdminUsername;Password=$sqlAdminPassword;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"

# SQL-komennot
$newLoginQuery = @"
CREATE LOGIN [$appUserName] 
WITH PASSWORD = '$appUserPassword';
"@

$newUserQuery = @"
CREATE USER [$appUserName] 
FOR LOGIN [$appUserName];
ALTER ROLE db_datareader ADD MEMBER [$appUserName];
ALTER ROLE db_datawriter ADD MEMBER [$appUserName];
"@

# Suoritus
try {
    # Avaa yhteys tietokantaan ja suorita kysely
    Write-Host "Luodaan kirjautuminen ja käyttäjä..." -ForegroundColor Green
    Invoke-Sqlcmd -ConnectionString $sqlConnectionString -Query $newLoginQuery
    Invoke-Sqlcmd -ConnectionString $sqlConnectionString -Query $newUserQuery
    Write-Host "Käyttäjä [$appUserName] luotu onnistuneesti." -ForegroundColor Cyan
} catch {
    Write-Error "Virhe käyttäjän luonnissa: $_"
}
