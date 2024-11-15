

# Tiedoston polku
$tiedosto = "C:\koodit\PS-Scriptit\Muumit.ps1"

# Määrittele skannauksen komento
$scanCommand = "C:\Program Files\Windows Defender\MpCmdRun.exe"
$scanArguments = "-Scan -File $tiedosto"

# Suorita tarkistus ja tallenna tulos
$tulos = Start-Process -FilePath $scanCommand -ArgumentList $scanArguments -Wait -PassThru

# Näytä tulos
Write-Host $tulos
