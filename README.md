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

PILVIPALVELUN ERILAISET TASOT

**Pilvipalvelumallit: PaaS, SaaS, IaaS ja muut**

### 1. Mitä pilvipalvelut ovat?
Pilvipalvelut tarjoavat mahdollisuuden käyttää IT-resursseja internetin välityksellä ilman tarvetta omille fyysisille laitteille tai infrastruktuurille. Palvelut jaetaan yleensä kolmeen päämalliin: **IaaS**, **PaaS** ja **SaaS**. Muita malleja ovat muun muassa **FaaS** ja **DaaS**.

---

### 2. Päämallit

#### **IaaS: Infrastructure as a Service**
- **Sisältö:**
  - Virtuaaliset palvelimet
  - Tallennustila
  - Verkkoyhteydet
  - Perusinfrastruktuuri
- **Kenelle sopii:** Yrityksille, jotka haluavat hallita IT-infrastruktuuriaan ilman fyysisiä laitteita.
- **Esimerkkejä:** Amazon Web Services (AWS), Microsoft Azure, Google Compute Engine
- **Hyödyt:**
  - Skaalautuvuus
  - Maksat vain käytöstä
  - Ei laitteiston hallinnan tarvetta

#### **PaaS: Platform as a Service**
- **Sisältö:**
  - Kehitysalustat
  - Sovelluskehitystyökalut
  - Tietokanta-alustat
- **Kenelle sopii:** Kehittäjille ja ohjelmistotiimeille, jotka tarvitsevat valmiin alustan sovellusten rakentamiseen ja ajamiseen.
- **Esimerkkejä:** Heroku, Google App Engine, Microsoft Azure App Services
- **Hyödyt:**
  - Nopeuttaa kehitystyötä
  - Ei tarvetta infrastruktuurin hallinnalle
  - Helppo integrointi muihin palveluihin

#### **SaaS: Software as a Service**
- **Sisältö:**
  - Valmiit ohjelmistot, joita käytetään internetin kautta
- **Kenelle sopii:** Loppukäyttäjille, jotka haluavat käyttää ohjelmistoja ilman asennuksia tai päivityksiä.
- **Esimerkkejä:** Microsoft 365, Google Workspace, Salesforce
- **Hyödyt:**
  - Helppokäyttöisyys
  - Automatisoidut päivitykset
  - Käyttö millä tahansa laitteella, jossa on verkkoyhteys

---

### 3. Muut pilvipalvelumallit

#### **FaaS: Function as a Service**
- **Sisältö:**
  - Palvelu, jossa ajataan yksittäisiä koodifunktioita ilman palvelimen hallintaa.
- **Esimerkkejä:** AWS Lambda, Google Cloud Functions
- **Hyödyt:**
  - Maksat vain koodin suorituksesta
  - Ei jatkuvaa infrastruktuurikustannusta

#### **DaaS: Desktop as a Service**
- **Sisältö:**
  - Etätyöpöydät, joita voidaan käyttää mistä tahansa laitteesta.
- **Esimerkkejä:** Citrix Virtual Apps and Desktops, VMware Horizon Cloud
- **Hyödyt:**
  - Mahdollistaa etätyöskentelyn
  - Helppo hallittavuus keskitetysti

---

### 4. Vertailu
| **Ominaisuus**      | **IaaS**             | **PaaS**              | **SaaS**              | **FaaS**              | **DaaS**              |
|---------------------|---------------------|-----------------------|-----------------------|-----------------------|-----------------------|
| **Hallitsema taso** | Infrastruktuuri      | Alusta                | Sovellus              | Funktiot              | Työpöytä              |
| **Skaalautuvuus**   | Korkea              | Korkea                | Rajallinen           | Korkea               | Keskitetty            |
| **Helppous**        | Vaatii hallintaa    | Helppokäyttöisempi    | Erittäin helppo      | Kehittäjille          | Loppukäyttäjille        |

---

### 5. Yhteenveto
Pilvipalvelut tarjoavat monipuolisia ratkaisuja erilaisiin tarpeisiin, olipa kyseessä infrastruktuurin, sovelluskehityksen tai valmiiden ohjelmistojen käyttö. Oikean mallin valinta riippuu organisaation tavoitteista, resursseista ja tarpeista.



Jos luo muuttujan yhdellä kielellä, ei voi viitata siihen toisella.
On kuitenkin mahdollista tallettaa muuttujia ympäristömuuttujiksi yhdellä kielellä ja sitten
toinen kieli perustaa oman muuttujansa ja hakee sille arvon siitä ympäristömuuttujasta suoritustilanteessa.
