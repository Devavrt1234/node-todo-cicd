#!/bin/bash

# Get the list of directories in the current directory
pwd

cd /opt/codedeploy-agent/deployment-root/a6fd13df-97f3-49db-ae6e-7dbe2e25062c/d-XLVDBJ368/deployment-archive

sudo apt install pm2@latest -g
pm2 start app.js
    


