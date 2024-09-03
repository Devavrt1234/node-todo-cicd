#!/bin/bash

sudo apt update -y
sudo npm install
cd /opt/codedeploy-agent
sudo systemctl status codedeploy-agent
sudo systemctl restart codedeploy-agent






