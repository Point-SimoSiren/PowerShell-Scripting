# Määritä tarkistettava kansio ja kokoraja (esim. 100 MB)
$kansio = "C:\koodit"
$kokorajaMB = 20

# Etsi suurimmat tiedostot
Get-ChildItem -Path $kansio -Recurse -File | Where-Object {
    $_.Length -gt ($kokorajaMB * 1MB)
} | Sort-Object Length -Descending | Select-Object Name, Directory, @{Name="Size(MB)"; 
Expression={"{0:N2}" -f ($_.Length / 1MB)}} | 
    
# Jos haluaa consoliin taulukkomuodossa (ft = format table):

ft

# Jos haluaa csv tiedostoon:

#Export-Csv -Path "C:\Raportit\SuurimmatTiedostot.csv" -NoTypeInformation

Write-Host "Raportti suurimmista tiedostoista luotu."
