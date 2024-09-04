#!/bin/bash

# Get the list of directories in the current directory
pwd

rsync -avz /opt/codedeploy-agent/deployment-root/a6fd13df-97f3-49db-ae6e-7dbe2e25062c/ /home/ubuntu

cd /home/ubuntu/d-OFYXVNU58/deployment-archieve 

sudo apt install pm2@latest -g
pm2 -f stop  --update-env  app.js
pm2 -f restart  --update-env  app.js

    


