# Määritä lähde- ja kohdekansiot
$lähde = "C:\Kansiopolku\jotain"
$kohde = "C:\Kansiopolku\jotain"

# Etsi kaikki .txt-tiedostot ja siirrä ne
Get-ChildItem -Path $lähde -Filter *.txt | ForEach-Object {
    Move-Item -Path $_.FullName -Destination $kohde
}

Write-Host "Tiedostot siirretty!"
