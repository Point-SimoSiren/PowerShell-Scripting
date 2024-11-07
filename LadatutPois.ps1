
# Putsaa ladatut ja roskakori

$targetPath = "C:\Users\Simppa\Downloads"

$filesToDelete = Get-ChildItem -Path $targetPath

# Poista jokainen tiedosto
foreach ($file in $filesToDelete) {
    Remove-Item -Path $file.FullName -Recurse -Force
}
Write-Host "Ladatut tyhjennetty."

# Poistaa kaikki tiedostot ja kansiot myös roskakorista
$Shell = New-Object -ComObject Shell.Application
$RecycleBin = $Shell.Namespace(10)
$RecycleBin.Items() | ForEach-Object { Remove-Item $_.Path -Recurse -Force }
 Write-Host -ForegroundColor "green" "Roskis tyhjennetty."

 # Exe tiedoston luonti em. scriptistä:
# Install-Module -Name ps2exe -Scope CurrentUser (jos ei ole asennettu ps2exe:ä vielä)
# Invoke-ps2exe .\LadatutPois.ps1 -output .\LadatutPois.exe
