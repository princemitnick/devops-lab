RG=""

az webapp create --resource-group $RG --plan pipo-app-service-01 --name pipo-nginx-01 --deployment-container-image-name nginx

"""
# Dockerfile
FROM nginx:latest
COPY default.conf /etc/nginx/conf.d/default.conf
COPY index.html /usr/share/nginx/html/index.html
"""

"""
# default.conf
server {
    listen 80;
    server_name localhost;
    
    location / {
        root /usr/share/nginx/html;
        index index.html index.htm;
        try_files $uri $uri/ =404;
    }
}
"""

"""
<!-- index.html -->
<html>
  <head>
    <title>Bienvenue sur Nginx CI/CD sur Azure!</title>
  </head>
  <body>
    <h1>Version 1 : Bienvenue sur Nginx CI/CD sur Azure!</h1>
  </body>
</html>
"""

git add Dockerfile default.conf index.html
git commit -m "Initial commit: Nginx CI/CD avec configuration personalisee"


#Configuration deploiement sur Azure

az webapp deployment source config-local-git --name pipo-nginx --resource-group $RG 

"url": "https://piponankayla01@pipo-nginx.scm.azurewebsites.net/pipo-nginx.git"

