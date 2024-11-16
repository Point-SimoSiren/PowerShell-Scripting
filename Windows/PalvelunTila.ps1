## Tämä scripti tarkistaa palvelun (service) tilan ja
## käynnistää sen uudelleen jos ei ole käynnissä

# Palvelun nimi
$palvelu = "nimi_tähän"

# Tarkista palvelun tila
$palvelunTila = Get-Service -Name $palvelu

if ($palvelunTila.Status -ne 'Running') {
    Start-Service -Name $palvelu
    Write-Host "$palvelu palvelu käynnistetty."
} else {
    Write-Host "$palvelu palvelu on jo käynnissä."
}