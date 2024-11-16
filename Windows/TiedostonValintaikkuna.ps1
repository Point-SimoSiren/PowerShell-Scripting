# Ladataan tarvittava .NET-luokka
Add-Type -AssemblyName System.Windows.Forms

# Luodaan tiedoston valintaikkuna
$dialog = New-Object System.Windows.Forms.OpenFileDialog

# Aloituspolku voi olla myös esim: MyDocuments tai Downloads
$dialog.InitialDirectory = [Environment]::GetFolderPath('Desktop')

$dialog.Filter = "Kaikki tiedostot (*.*)|*.*"
$dialog.Title = "Valitse tiedosto"

# Näytetään valintaikkuna ja käsitellään käyttäjän valinta
if ($dialog.ShowDialog() -eq [System.Windows.Forms.DialogResult]::OK) {
    $selectedFile = $dialog.FileName
    Write-Output "Valitsit tiedoston: $selectedFile"
    
    # Tässä voit käsitellä tiedostoa
    # Esimerkiksi lukea tiedoston sisältö:
    $content = Get-Content -Path $selectedFile
    Write-Output "Tiedoston sisältö:"
    Write-Output $content
} else {
    Write-Output "Tiedoston valinta peruutettu."
}
