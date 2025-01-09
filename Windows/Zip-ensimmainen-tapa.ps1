
# Tapa, joka vaatii 5. version tai uudemman:

# PowerShellilla voidaan pakata kansio ZIP-tiedostoksi käyttämällä
# sisäänrakennettua .NET Frameworkin luokkaa System.IO.Compression.ZipFile

# Tämä voisi olla varmuuskopiointirutiini, joka pakkaa kohteen
# ja siirtää sen esim. toiselle asemalle

# Kansion polku, joka halutaan pakata
$SourceFolder = "C:\Koodit"

# Yksilöivä aikaleima tiedostonimeä varten
$aikaleima = Get-Date -Format "yyyyMMdd_HHmmss"

# ZIP-tiedoston kohdepolku ja nimi
$DestinationZip = "C:\Varmuuskopiot\" + $aikaleima + ".zip"

# Pakkaa kansio ZIP-tiedostoksi
Add-Type -AssemblyName System.IO.Compression.FileSystem
[System.IO.Compression.ZipFile]::CreateFromDirectory($SourceFolder, $DestinationZip)

Write-Output "Kansio pakattu onnistuneesti: $DestinationZip"

#####
# Toinen tapa, ja ainoa 5. versiota vanhemmalla PS:llä

# Käytetään Compress-Archive cmdlet´iä

# Compress-Archive -Path "C:\Polku\Kansio" -DestinationPath "C:\Polku\Paketti.zip"
# Write-Output "Kansio pakattu onnistuneesti"
