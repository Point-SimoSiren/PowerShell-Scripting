# Hae tiedot C-asemasta
$diskInfo = Get-WmiObject Win32_LogicalDisk -Filter "DeviceID='C:'" | Select-Object Size, FreeSpace

# Tulosta tiedot
Write-Host "C-aseman tila:"
Write-Host "Koko: $($diskInfo.Size / 1GB) GB"
Write-Host "Vapaa tila: $($diskInfo.FreeSpace / 1GB) GB"
Write-Host "Varattu tila: $(($diskInfo.Size - $diskInfo.FreeSpace) / 1GB) GB"