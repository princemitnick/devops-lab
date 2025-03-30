npm init -y
npm install express

node app.js


git init
git add .
git commit -m "Initial commit de l'application Node.js"


az webapp deployment source config-local-git --name NomDeMaWebApp --resource-group MonPremierGroupe


az webapp create --resource-group 1-76b2f767-playground-sandbox --plan MonAppServicePlan --name NomDeMaWebApp --runtime "node|14"


az webapp create --resource-group $RG --plan AppServicePlan --name PipoApp --runtime "NODE:22-lts"


#"url": "https://None@pipoapp.scm.azurewebsites.net/PipoApp.git"


