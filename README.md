LUE TÄMÄ
========

Ei kannata ladata tai kloonata tätä repoa itselleen käytettäväksi, koska silloin se ei ole sinun
koneella luotu, eikä näitä ole digitaalisesti signeerattu, joten koneesi remote signed asetus ei salli näiden
suorittamista.
Perusta oma kansio ja luo tarvitsemasi tiedostot käsin. Koodin voit ottaa Copy - Paste tyylillä
näistä tiedostoista jos haluat.

LUE TÄMÄ LIITTYEN 2. VIIKON AZURE OSUUTEEN
==========================================

PowerShell Azure moduuli (Az)
--------------------------
Anna asennuskomento PowerShelliin missä tahansa hakemistopolussa:
**Install-Module -Name Az -Repository PSGallery -Force**

Moduuli käyttää PowerShellille tyypillistä Verbi-Substantiivi komentotyyliä.
Jos omaa kokemusta PowerShellistä ja esim. system admin taustaa tämä työkalu voi olla mieluisampi.
Kurssimme ASP.NET Core MVC julkaisuesimerkki hyödyntää tätä moduulia.

Jos tarvitsee päivittää moduuli joskus:
Update-Module -Name Az -Force

Azure CLI
---------

Azure CLI ei ole PowerShellin oma moduuli vaan sitä voidaan käyttää mm. CMD, PowerShell, Bash.. komentorivityökalulla.
Static web app esimerkki kurssillamme käyttää Azure CLI:tä.

Azure CLI:n (Command-Line Interface) komentojen tyyli on enemmän komentorivipohjainen ja yksinkertainen, sillä se seuraa yleistä Unix/Linux tyyliä ja syntaksia. Komennot ovat lyhyitä ja selkeitä, ja niitä käytetään usein yhdistettäväksi putkikomennoiksi ja skripteihin.

Erityisesti Azure CLI:n komennot muistuttavat enemmän tavallisia Linux tai macOS -terminaalikomentoja. Esimerkiksi komennot ovat usein muotoa az <resource> <action> <parameters>. Tämä rakenne on hyvin samanlainen kuin monissa muissa komentorivipohjaisissa työkaluissa.

Azure CLI:n komennot ovat siis tiiviitä ja suoria, ja ne on suunniteltu siten, että käyttäjä voi helposti kirjoittaa ne komentoriville ilman tarvetta erillisille PowerShell-objekteille tai -moduuleille.

Asenna Azure CLI täältä:
**https://learn.microsoft.com/en-us/cli/azure/install-azure-cli-windows?tabs=azure-cli#install-or-update**

Asennussivulla on 4 eri vaihtoehtoa asennukseen. Olen käyttänyt Microsoft Installer (MSI):tä ja 64 bittistä versiota.
Se on toiminut hyvin.

Az ja Azure CLI yhdistely
-------------------------
Molempien komentoja sisältäviä skriptejä voidaan tallettaa PowerShell:in .ps1 tiedostoon yhtälailla.

Molempien komentoja voi käyttää sekaisin samoissa scripteissä, mutta yksi komento pitää tehdä yhdellä "kielellä" alusta loppuun.

Jos luo muuttujan yhdellä kielellä, ei voi viitata siihen toisella.
On kuitenkin mahdollista tallettaa muuttujia ympäristömuuttujiksi yhdellä kielellä ja sitten
toinen kieli perustaa oman muuttujansa ja hakee sille arvon siitä ympäristömuuttujasta suoritustilanteessa.
