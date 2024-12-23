# Kysytään käyttäjältä kuukausimäärä
$months = Read-Host -Prompt "Syötä kuukausien määrä"

# Muutetaan käyttäjän syöte kokonaisluvuksi
$months = [int]$months

# Tarkistetaan, että syöte on positiivinen kokonaisluku
if ($months -le 0) {
    Write-Output "Anna positiivinen kokonaisluku."
    exit
}

# Lasketaan päivämääräraja
$dateThreshold = (Get-Date).AddMonths(-$months)

# Kansion polku, josta haluat etsiä (muuta tarvittaessa)
$folderPath = "C:\tallenteet"

# Tarkistetaan, että kansio on olemassa
if (-Not (Test-Path -Path $folderPath)) {
    Write-Output "Annettu kansiopolku ei ole olemassa."
    exit
}

# Haetaan kaikki kansiot ja suodatetaan ne, joita ei ole käytetty annetun pvm jälkeen
$oldFolders = Get-ChildItem -Path $folderPath -Directory | Where-Object {
    $_.LastAccessTime -lt $dateThreshold
}

# Tulokset terminaaliin
if ($oldFolders.Count -eq 0) {
    Write-Output "Ei löytynyt kansioita, joita ei olisi käytetty $months kuukauteen."
} else {
    Write-Output "Kansiot, joita ei ole käytetty $months kuukauteen:"
    $oldFolders | ForEach-Object { Write-Output $_.FullName }
}
