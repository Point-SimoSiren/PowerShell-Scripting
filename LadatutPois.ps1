
# Putsaa ladatut ja roskakori

$targetPath = "C:\Users\Simppa\Downloads"

$filesToDelete = Get-ChildItem -Path $targetPath

# Poista jokainen tiedosto
foreach ($file in $filesToDelete) {
    Remove-Item -Path $file.FullName -Recurse -Force
}
Write-Host "Ladatut tyhjennetty."

# Poistaa kaikki tiedostot ja kansiot roskakorista
$Shell = New-Object -ComObject Shell.Application
$RecycleBin = $Shell.Namespace(10)
$RecycleBin.Items() | ForEach-Object { Remove-Item $_.Path -Recurse -Force }
 Write-Host "Roskis tyhjennetty."