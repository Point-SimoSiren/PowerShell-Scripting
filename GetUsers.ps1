# Hae kaikki käyttäjätietokoneen WMI-palvelusta
$users = Get-WmiObject Win32_UserAccount

# Näytä käyttäjätiedot
foreach ($user in $users) {
    Write-Host "Käyttäjänimi: $($user.Caption)"
    Write-Host "Koko nimi: $($user.FullName)"
    Write-Host "Käyttäjän tyyppi: $($user.AccountType)"
    Write-Host "SID: $($user.SID)"
    Write-Host "----"
}