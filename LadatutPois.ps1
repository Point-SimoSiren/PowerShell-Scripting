# Määritä polku, josta haluat poistaa tiedostot
$targetPath = "C:\Users\Simo\Downloads"

try {
    # Tarkista, onko kohdepolku olemassa
    if (Test-Path $targetPath -PathType Container) {
        # Hae kaikki tiedostot määritetystä polusta
        $filesToDelete = Get-ChildItem -Path $targetPath

        # Poista jokainen tiedosto
        foreach ($file in $filesToDelete) {
            Remove-Item -Path $file.FullName -Force
            Write-Host "Tiedosto poistettu: $($file.FullName)"
        }

        Write-Host "Kaikki tiedostot poistettu onnistuneesti."

    } else {
        Write-Host "Kohdepolkua ei löytynyt: $targetPath"
    }
} catch {
    Write-Host "Virhe poistettaessa tiedostoja: $_"
}