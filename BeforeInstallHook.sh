#!/bin/bash

sudo apt update -y
sudo npm install
sudo systemctl status codedeploy-agent
sudo systemctl restart codedeploy-agent

dir_path="/opt/codedeploy-agent/deployment-root/a6fd13df-97f3-49db-ae6e-7dbe2e25062c"

if [ -d "$dir_path" ]; then
    echo "The directory exists code is brought by aws code deploy-agent successfully"
    cd "$dir_path"

    directories=(d-0AMA4RR58 d-28XUAVR58 d-2IDSAVR58 d-6XFRXFS58 d-F6JRF0S58)

    for directory in "${directories[@]}"; do
        current_directory="$directory"
        if [ -d "$current_directory" ]; then
            cd "$current_directory"
            if [ -d "deployment-archive" ]; then
                cd "deployment-archive"
                node app.js
               
            else
                echo "deployment-archive directory does not exist in $current_directory"
            fi
        else
            echo "Directory $current_directory does not exist"
        fi
    done
else
    echo "not going anywhere"
fi
