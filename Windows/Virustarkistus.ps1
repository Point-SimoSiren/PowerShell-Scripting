# VIRUSTARKISTUS

# Kohdetiedoston polku
$tiedosto = "C:\koodit\PS-Scriptit\TyhjennaRoskakori.ps1"

# Määrittele virusskannauksen komento
$scanCommand = "C:\Program Files\Windows Defender\MpCmdRun.exe"
$scanArguments = "-Scan -File $tiedosto"

# Suorita tarkistus ja tallenna tulos
$tulos = Start-Process -FilePath $scanCommand -ArgumentList $scanArguments -Wait -PassThru

# Näytä tulos
Write-Host $tulos
