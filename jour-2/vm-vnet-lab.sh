#Creatin d'un Vnet


RG = ""

az network vnet create \
--resource-group $RG \
--name PipoVNet \
--address-prefix 10.0.0.0/16 \
--subnet-name Pipo-subnet-01 \
--subnet-prefix 10.0.1.0/24


#Creation du NSG

az network nsg create \
--resource-group $RG \
--name PipoNSG


#Ajout des regles ssh, http et https

az network nsg rule create \
--resource-group $RG \
--nsg-name PipoNSG \
--name Allow-SSH \
--protocol tcp \
--priority 1001 \
--destination-port-range 22 \
--access allow 


az network nsg rule create \
--priority 1002 \
--name Allow-HTTP \
--nsg-name PipoNSG \
--protocol tcp \
--priority 1002 \
--destination-port-range 80 \
--access allow

az network nsg rule create \
--priority 1003 \
--nsg-name PipoNSG \
--name Allow-HTTPS \
--protocol tcp \
--destination-port-range https \
--access allow


#Creation de la VM avec PipoVNet 

az vm create \
--resource-group $RG \
--name PipoVM01 \
--image Ubuntu2404 \
--vnet-name PipoVNet \
--subnet Pipo-subnet-01 \
--admin-username azureuser \
--generate-ssh-keys


#Recuperation du nom de l'interface reseau associe a la VM

az vm show --resource-group $RG --name PipoVM01 --query "networkProfile.networkInterfaces[0].id" -o tsv


#Lister NIC 

az network nic list --resource-group $RG -o table

#Attacher Vm to the NSG

az network nic update \
--resource-group $RG \
--name PipoVM01 \
--network PipoVM01Nic

#Verifier que le Vnet et le NSG sont bien configure

az network vnet show --resource-group $RSG --name PipoVNet


#Verifier que les  regles NSG

az network nsg show --resource-group $RG --name PipoNSG -o table


#Recuperer l'adress IP du VM

az vm show --resource-group --name PipoVM01 -d --query "publicIps" -o tsv

