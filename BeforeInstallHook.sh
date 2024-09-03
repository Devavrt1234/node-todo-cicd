#!/bin/bash
sudo apt update -y
sudo npm install
sudo install nodejs
sudo systemctl status codedeploy-agent
sudo systemctl restart codedeploy-agent



dir_path="/opt/codedeploy-agent/deployment-root/a6fd13df-97f3-49db-ae6e-7dbe2e25062c"  # replace with the directory you want to check

if [ -d "$dir_path" ]; then
    echo "The directory exists code is brought by aws code deploy-agent successfully"
    cd "$dir_path"

 
    directories=(d-0AMA4RR58 d-28XUAVR58 d-2IDSAVR58 d-6XFRXFS58 d-F6JRF0S58)

  
    current_directory=${directories[0]}
    switch=0
    if [ -d "$current_directory" ]; then
     cd "$current_directory"
     cd deployment-archive
     node app.js
    else 
     #switching to the next directory 
     switch+=1
     cd ${directories[switch]}
     cd deployment-archive
     node app.js

     
    
  
else
   echo "not going anywhere"

fi






