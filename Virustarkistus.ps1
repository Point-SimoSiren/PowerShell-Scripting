# Tiedoston polku
$tiedosto = "C:\koodit\PS-Scriptit\Muumit.ps1"

# Suorita tarkistus ja tallenna tulos
$tulos = & "C:\Program Files\Windows Defender\MpCmdRun.exe" -Scan -File "$tiedosto"

# Näytä tulos: Ei toimi vielä kovin järkevästi
write-host $tulos

