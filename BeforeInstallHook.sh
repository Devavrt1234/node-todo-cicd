#!/bin/bash

sudo apt update -y
sudo npm install
sudo systemctl status codedeploy-agent
sudo systemctl restart codedeploy-agent

#!/bin/bash

# Get the list of directories in the current directory
directories="/opt/codedeploy-agent/deployment-root/a6fd13df-97f3-49db-ae6e-7dbe2e25062c"

# Get the newest directory
newest_dir=$(printf "%s\n" "${directories[@]}" | sort -n | tail -1)

# Rsync the newest directory to /home/ubuntu
rsync -avz "$newest_dir"/ /home/ubuntu/





