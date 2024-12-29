
# Tehtävän ajastuksen testaamista varten tehty skripti

Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.MessageBox]::Show("Ajastus toimii!")


# Exe tiedoston luonti em. scriptistä:

# Install-Module -Name ps2exe -Scope CurrentUser (jos ei ole asennettu ps2exe:ä vielä)
# Invoke-ps2exe .\LadatutPois.ps1 -output .\LadatutPois.exe