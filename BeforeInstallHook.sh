#!/bin/bash
sudo apt update -y
sudo npm install
sudo install nodejs
sudo systemctl status codedeploy-agent
sudo systemctl restart codedeploy-agent



dir_path="/home/ubuntu/views"  # replace with the directory you want to check

if [ -d "$dir_path" ]; then
    echo "The directory exists code is brought by aws codedeploy-agent successfully"
    cd /opt/codedeploy-agent/deployment-root/a6fd13df-97f3-49db-ae6e-7dbe2e25062c/d-5NNB8XC58/deployment-archive
    pm2 start app.js
else

    echo "The directory does not exist.some error occurred"
fi
