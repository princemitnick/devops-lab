#Creation de groupe de ressource

az group create --name MyResourceGroup --location

RG = ""

#Create App Service Plan on Linux

az appservice plan create --name PipoAppService-01 --resource-group --sku FREE --is-linux 

#Creation web app with node.js runtime

az webapp create --resource-group $RG --plan PipoAppSerivce-01 --name PipoApp-01 --runtime "node|22-lts"

#Node.js App initialization

npm init -y
npm install express

"""
// app.js
const express = require('express');
const app = express();
const PORT = process.env.PORT || 3000;

app.get('/', (req, res) => {
  res.send('Bienvenue sur ma première version de l\'application Node.js sur Azure !');
});

app.listen(PORT, () => {
  console.log(`Serveur démarré sur le port ${PORT}`);
});
"""

#git init

git init 
git add .
git commit -m "Initial commit - first version of node.js app"


#Configrer le deploiement continu (local GIt) sur Azure

az webapp deployment source config-local-git --name pipo-app-01 --resource-group $RG 

#"url": "https://piponankayla01@pipo-app-01.scm.azurewebsites.net/pipo-app-01.git"

git remote add azure https://piponankayla01@pipo-app-01.scm.azurewebsites.net/pipo-app-01.git


git push azure master

