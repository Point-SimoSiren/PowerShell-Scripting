# Poistaa kaikki tiedostot ja kansiot roskakorista
# Tuloste vihreällä värillä
# Virhetilanteessa ei tule generoitua virhesanomaa, vaan oma error teksti

try {
  $Shell = New-Object -ComObject Shell.Application
  $RecycleBin = $Shell.Namespace(10)
  $RecycleBin.Items() | ForEach-Object { Remove-Item $_.Path -Recurse -Force }
  Write-Host -ForegroundColor "green" "roskakori tyhjennetty"
}
catch {
  write-warning "error"
}
