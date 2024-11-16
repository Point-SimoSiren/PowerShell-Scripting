#Suurimmat tiedostot listalle tai csv tiedostoon

# Määritä tarkistettava kansio ja MB kokoraja
$tarkistettavaKansio = "C:\Tallenteet"
$kokorajaMB = 30

$valinta = Read-Host "Missä muodossa haluat raportin suurista tiedostoista?
`n1 - CSV tiedostoon `n2 - Konsoliin"

# JOS VALINTA OLI CSV TIEDOSTO
if ($valinta -eq "1") {

    $raporttiKansio = "C:\Raportit"
    $raporttiTiedosto = "Suurimmat.csv"

# Tarkista, onko raporttikansio jo olemassa
if (Test-Path -Path $raporttiKansio) {
    # Jos on olemassa
    Write-Output "Kansio löytyi: $raporttiKansio"
} else {
    # Luo raporttikansio, jos sitä ei ole
    New-Item -ItemType Directory -Path $raporttiKansio
    Write-Output "Kansio luotiin: $raporttiKansio"
}

# Etsi suurimmat tiedostot
Get-ChildItem -Path $tarkistettavaKansio -Recurse -File | Where-Object {
    $_.Length -gt ($kokorajaMB * 1MB)
} | Sort-Object Length -Descending | Select-Object Name, Directory, @{Name="Size(MB)"; 
Expression={"{0:N2}" -f ($_.Length / 1MB)}} |

#csv tiedostoon:
Export-Csv -Path $raporttiKansio\$raporttiTiedosto -NoTypeInformation -Force

Write-Host "Raportti suurimmista tiedostoista luotu: $raporttiKansio\$raporttiTiedosto"
}

############################################################

# JOS VALINTA OLI KONSOLI
elseif ($valinta -eq "2") {

    Write-Output "Valitsit konsolin"

# Etsi suurimmat tiedostot
Get-ChildItem -Path $tarkistettavaKansio -Recurse -File | Where-Object {
    $_.Length -gt ($kokorajaMB * 1MB)
} | Sort-Object Length -Descending | Select-Object Name, Directory, @{Name="Size(MB)"; 

Expression={"{0:N2}" -f ($_.Length / 1MB)}} | ft #(ft = format table)


} else {
    Write-Output "Virheellinen valinta"
}
