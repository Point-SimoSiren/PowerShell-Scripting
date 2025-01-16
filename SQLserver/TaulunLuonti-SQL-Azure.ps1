# Taulun luominen Azure SQL tietokantaan #

# Pitää olla asennettuna ao. PowerShellin moduuli:
# Install-Module -Name SqlServer -AllowClobber -Force

## HUOM! @ merkin jälkeen (rivi 14) voidaan antaa SQL lause ja sen myötä suorittaa mitä ##
## tahansa SQL kielisiä toimintoja PowerShell scriptissä, ei vain taulun luontia ##

# Korvaa arvot todellisen olemassaolevan tietokannan oikeilla arvoilla
$serverName = "luotavaserverinnimi.database.windows.net"
$databaseName = "minundb"

$tableCreateQuery = @"
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    HireDate DATE
);
"@

# Ao. komento pyytää antamaan tunnukset konsolissa kun scripti suotitetaan
$sqlCredential = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $username, $securePassword

Invoke-Sqlcmd -ServerInstance $serverName -Database $databaseName -Credential $sqlCredential -Query $tableCreateQuery
