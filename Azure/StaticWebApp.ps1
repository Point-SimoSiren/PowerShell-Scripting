
## Tämä skripti luo staattisen webbisivun jossa ei tarvita
## itse tehtyä / ylläpidettyä backendiä
## Voisi olla esim perus html+css sivuston tai Reactin buildatun
## julkaisukelpoisen frontin julkaisussa

# Lataa ja asenna Azure CLI, jos ei ole asennettuna:
# https://learn.microsoft.com/en-us/cli/azure/install-azure-cli

# Tiedoksi, että skripti tekee OAuth kirjautumisen Azureen ja pyytää GitHubiin pääsemiseksi syöttämään
# terminaalissa näkyvät merkit selaimeen avautuvaan ikkunaan

# Kirjautuminen Azureen
az login

# Jos on jo olemassa sopiva Resource Group, niin ei ole tietenkääm pakko aina luoda uutta,
# mutta sitten pitää viimeisessä staticwebapp create -komennossa antaa sen nimi
az group create --name webSivuGroup --location westeurope

# Static webappin perustaminen Azureen
az staticwebapp create --name minunWebSivu --resource-group webSivuGroup --location westeurope `
 --source https://github.com/Point-SimoSiren/pshell-webbisivu-azureen `
 --branch main --login-with-github
