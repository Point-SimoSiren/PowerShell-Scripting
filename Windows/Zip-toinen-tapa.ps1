# Toinen tapa, ja ainoa 5. versiota vanhemmalla PS:llä

# Käytetään Compress-Archive cmdlet´iä

Compress-Archive -Path "C:\Koodit\PS-SCRIPTIT" -DestinationPath "C:\Varmuuskopiot\scriptit.zip"
Write-Output "Kansio pakattu onnistuneesti"