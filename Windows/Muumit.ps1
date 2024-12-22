### Tällä skriptillä voidaan saavuttaa tilanne, jossa klikkaamalla
ikonia pääsee katsomaan muumeja tai jotain muuta aihetta ###

# Määritä YouTube-hakusana
$searchQuery = "muumit suomeksi"

# Korvaa välilyönnit URL-koodilla
$encodedQuery = [System.Web.HttpUtility]::UrlEncode($searchQuery)

# Luo YouTube-haku-URL
$url = "https://www.youtube.com/results?search_query=$encodedQuery"

# Avaa Chrome annetulla URL:lla
Start-Process "chrome.exe" $url

# Exe tiedoston luonti em. scriptistä:
# Install-Module -Name ps2exe -Scope CurrentUser (jos ei ole asennettu ps2exe:ä vielä)
# Invoke-ps2exe .\Muumit.ps1 -output .\muumit.exe

# Exe tiedoton voi siirtää minne haluaa, tai tehdä pikakuvakkeen
