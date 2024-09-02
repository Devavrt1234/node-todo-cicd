#!/bin/bash
sudo apt update -y
sudo npm install
sudo install nodejs
sudo systemctl status codedeploy-agent
sudo systemctl restart codedeploy-agent



dir_path="/home/ubuntu/views"  # replace with the directory you want to check

if [ -d "$dir_path" ]; then
    echo "The directory exists code is brought by aws codedeploy-agent successfully"
else
    echo "The directory does not exist.some error occurred"
fi
