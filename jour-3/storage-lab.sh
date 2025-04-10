RG="1-a915b9fd-playground-sandbox"
LOCATION="eastus"
ACCOUNT_NAME="piponankaylasto01"
CONTAINER_NAME = "pipo-container01"


#Creation d'un compte de stockage

az storage account create \
  --name $ACCOUNT_NAME \
  --resource-group $RG \
  --location $LOCATION \
  --sku Standard_LRS

#Creation d'un conteneur Blobs

az storage container create \
  --name $CONTAINER_NAME \
  --account-name $ACCOUNT_NAME \
  --public-access blob

#Uploader un fichier

echo "Bienvenue sur Azure Storage!" > welcome.txt
az storage blob upload \
  --account-name $ACCOUNT_NAME \
  --container-name $CONTAINER_NAME \
  --name welcome.txt \
  --file welcome.txt


#Verifier l'upload

az storage blob list \
  --account-name mystorageaccountunique \
  --container-name mycontainer \
  --output table


#Creer un serveur SQL 

az sql server create \
  --name mysqlserverunique \
  --resource-group MyResourceGroup \
  --location francecentral \
  --admin-user sqladmin \
  --admin-password "ComplexeMDP123!"


#Creer une base de donnees mydatabase

az sql db create \
  --resource-group MyResourceGroup \
  --server mysqlserverunique \
  --name mydatabase \
  --service-objective S0


#Configurer le parefeu du serveur SQL

az sql server firewall-rule create \
  --resource-group MyResourceGroup \
  --server mysqlserverunique \
  --name AllowYourIP \
  --start-ip-address <Ton_IP> \
  --end-ip-address <Ton_IP>



