
# Lataa ja asenna Azure CLI:
# https://learn.microsoft.com/en-us/cli/azure/install-azure-cli

# Kirjautuminen Azureen
az login

az group create --name webSivuGroup --location westeurope


# Static webappin perustaminen Azureen
az staticwebapp create --name minunWebSivu --resource-group webSivuGroup --location westeurope `
 --source https://github.com/Point-SimoSiren/pshell-webbisivu-azureen `
 --branch main --login-with-github


# Tekee OAuth kirjautumisen julkaisun aikana ja pyytää syöttämään
# terminaalissa näkyvät merkit selaimeen avautuvaan ikkunaan