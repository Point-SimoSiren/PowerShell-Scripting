# Poistaa viimeisimmät tiedostot ja kansiot Quick Access -näkymästä
$recentItemsPath = [System.IO.Path]::Combine($env:APPDATA, "Microsoft\Windows\Recent")
$automaticDestinationsPath = [System.IO.Path]::Combine($env:APPDATA, "Microsoft\Windows\Recent\AutomaticDestinations")
$customDestinationsPath = [System.IO.Path]::Combine($env:APPDATA, "Microsoft\Windows\Recent\CustomDestinations")

# Poistaa kaikki tiedostot Recent-kansiosta
if (Test-Path $recentItemsPath) {
    Remove-Item "$recentItemsPath\*" -Recurse -Force

}

# Poistaa kaikki tiedostot AutomaticDestinations-kansiosta
if (Test-Path $automaticDestinationsPath) {
    Remove-Item "$automaticDestinationsPath\*" -Recurse -Force
}

# Poistaa kaikki tiedostot CustomDestinations-kansiosta
if (Test-Path $customDestinationsPath) {
    Remove-Item "$customDestinationsPath\*" -Recurse -Force
}

# Poistaa File Explorerin hakuehdotukset
$searchHistoryKey = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\WordWheelQuery"

if (Test-Path $searchHistoryKey) {
    Remove-Item "$searchHistoryKey\*" -Recurse -Force
}

Write-Host "Viimeisimpien tiedostojen lista ja hakuehdotukset on poistettu."
