az login 


#Creation d'un groupe de ressources

az group create --name FirstGroup --location eastus


#Creation app service

az appservice plan create --name AppServicePlan --resource-group FirstGroup --sku FREE

#Deploiement d'une web app

az webapp create --resource-group $RG --plan AppServicePlan --name MyApp --runtime "node|14-lts"


#Verification webApp

az webapp show --resource-group $RG --name MyApp


#Supprimer un App Service Plan 

az appservice plan delete --name AppServicePlan --resource-group $RG --yes


#lister environnement disponible

az webapp list-runtimes --os-type linux


az appservice plan create --name MonAppServicePlan --resource-group MonPremierGroupe --sku FREE --is-linux