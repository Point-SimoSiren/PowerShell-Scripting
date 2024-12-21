# Määritä kansio ja päivämäärärajat
$kansio = "C:\koodit\PS-SCRIPTIT"
$aikaRaja = (Get-Date).AddDays(-1)

# Hae tiedostot, jotka on muutettu viikon sisällä
$muuttuneetTiedostot = Get-ChildItem -Path $kansio -Recurse | Where-Object {
    $_.LastWriteTime -gt $aikaRaja
}

# Suorita "virustarkistus" muuttuneille tiedostoille
foreach ($tiedosto in $muuttuneetTiedostot) {
    Write-Host -ForegroundColor yellow "Tarkistetaan tiedosto: $($tiedosto.FullName)"
    

    # Virustarkistuksen suorittaminen Windows Defenderillä:
    Start-Process -FilePath "C:\Program Files\Windows Defender\MpCmdRun.exe" -ArgumentList "-Scan", "-File", "$($tiedosto.FullName)" 

    Write-Host -ForegroundColor green "- ok -"
    Write-Host "__________________________________________________"

}
Write-Host "**..**..**..**..**..**..**.."

Write-Host "Tarkistus suoritettu kaikille muuttuneille tiedostoille."
