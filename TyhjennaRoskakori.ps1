# Poistaa kaikki tiedostot ja kansiot roskakorista
$Shell = New-Object -ComObject Shell.Application
$RecycleBin = $Shell.Namespace(10)
$RecycleBin.Items() | ForEach-Object { Remove-Item $_.Path -Recurse -Force }