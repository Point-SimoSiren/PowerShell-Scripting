###LUE TÄMÄ LIITTYEN 2. VIIKON AZURE OSUUTEEN

PowerShellin Azure moduulin asennus komento joka annetaan PowerShelliin:
Install-Module -Name Az -Repository PSGallery -Force

Moduuli käyttää PowerShellille tyypillistä Verbi-Substantiivi komentotyyliä.
Ainakin MVC julkaisuesimerkki hyödyntää tätä moduulia.

Jos tarvitsee päivittää moduuli joskus:
Update-Module -Name Az -Force

-------------------------------------------------------------
Puolestaan:

Ainakin static web app esimerkki käyttää Azure CLI:tä.

Azure CLI ei ole PowerShellin oma moduuli vaan sitä voidaan käyttää mm. CMD, PowerShell, Bash.. komentorivityökalulla.

Se voidaan asentaa täältä:
https://learn.microsoft.com/en-us/cli/azure/install-azure-cli-windows?tabs=azure-cli#install-or-update
Olen käyttäntyt 4 eri vaihtoehdosta tätä:
Microsoft Installer (MSI)
--------------------------------------------------------------------------

Näitä komentoja voi käyttää sekaisin samoissa scripteissä, mutta yksi komento on syytä tehdä yhdellä "kielellä".
Jos luo muuttujan yhdellä kielellä, ei voi viitata siihen toisella.
On kuitenkin mahdollista tallettaa muuttujia ympäristömuuttujiksi yhdellä kielellä ja sitten
toinen kieli hakee arvon siitä ympäristömuuttujasta.

Näitä molempia voi tallettaa .ps1 tiedostoon yhtälailla.
