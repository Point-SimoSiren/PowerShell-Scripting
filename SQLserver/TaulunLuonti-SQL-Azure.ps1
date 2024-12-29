# Taulun luominen Azure SQL tietokantaan #

# Pitää olla asennettuna ao. PowerShellin moduuli:
# Install-Module -Name SqlServer -AllowClobber -Force


# Korvaa arvot todellisen olemassaolevan tietokannan oikeilla arvoilla
$serverName = "luotavaserverinnimi.database.windows.net"
$databaseName = "minundb"
$username = "xxxxxx"
$password = "xxxxxx"
$tableCreateQuery = @"
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    HireDate DATE
);
"@

# Convert the password to a secure string and create a credential object
$securePassword = ConvertTo-SecureString -String $password -AsPlainText -Force
$sqlCredential = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $username, $securePassword

Invoke-Sqlcmd -ServerInstance $serverName -Database $databaseName -Credential $sqlCredential -Query $tableCreateQuery
