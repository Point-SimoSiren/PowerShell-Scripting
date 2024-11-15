## Tämä toimii vain jos AD server on käytössä ##
## En ole saanut toimimaan omassa koneessa ##

# Tarkitus onko AD moduulia koneella
# Get-Module -ListAvailable -Name ActiveDirectory

# Windows 10 ja 11:
# Etsi ja asenna Active Directory -moduuli RSAT-paketista
# Add-WindowsCapability -Online -Name Rsat.ActiveDirectory.DS-LDS.Tools~~~~0.0.1.0

# Windows Serverillä: Add-WindowsFeature -Name RSAT-AD-PowerShell

# Lataa Active Directory -moduuli
Import-Module ActiveDirectory

# Hae kaikki käyttäjät ja tallenna tiedot CSV-tiedostoon
Get-ADUser -Filter * -Property Name, Department, EmailAddress | 
    Select-Object Name, Department, EmailAddress | 
    Export-Csv -Path "C:\Raportit\Käyttäjäraportti.csv" -NoTypeInformation

Write-Host -ForegroundColor green "Käyttäjäraportti luotu onnistuneesti:"
Write-Host -ForegroundColor green "C:\Raportit\Käyttäjäraportti.csv"
