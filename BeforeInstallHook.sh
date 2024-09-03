#!/bin/bash

sudo apt update -y
sudo npm install
sudo systemctl status codedeploy-agent
sudo systemctl restart codedeploy-agent






