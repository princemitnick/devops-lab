#Creatin de App Service Plan et Web APp avec Node.js


RG=""
LOCATION="eastus"

az appservice plan create --name MyLinuxPlan --resource-group MyResourceGroup --sku FREE --is-linux

az webapp create --resource-group MyResourceGroup --plan MyLinuxPlan --name MyNodeAppUniqueName --runtime "node|22-lts"

