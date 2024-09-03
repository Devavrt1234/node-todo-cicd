#!/bin/bash

sudo apt update -y
sudo npm install
sudo systemctl status codedeploy-agent
sudo systemctl restart codedeploy-agent

dir_path="/opt/codedeploy-agent/deployment-root/a6fd13df-97f3-49db-ae6e-7dbe2e25062c/d-PBOXI1U58/deployment-archive"

cd "$dir_path"
node app.js

