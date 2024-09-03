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





# Loop through the directories until we find an existing one
for directory in "${directories[@]}"; do
  # Check if the directory exists
  if [ -d "$directory" ]; then
    # If it exists, switch to that directory
    cd "$directory"
    node app.js
    

    
    # Break the loop as we've found an existing directory
    break
  else
    # If the directory doesn't exist, move to the next one
    cd ${directories[-1]}
    node app.js
  fi
done

# Print the updated array
echo "Updated array of directories:"
printf '%s\n' "${directories[@]}"

# Create a new directory with the given UUID
mkdir -p "codedeploy-agent/a6fd13df-97f3-49db-ae6e-7dbe2e25062c"
echo "Created new directory: codedeploy-agent/a6fd13df-97f3-49db-ae6e-7dbe2e25062c"

# Add the new directory to the array
directories+=("codedeploy-agent/a6fd13df-97f3-49db-ae6e-7dbe2e25062c")
echo "Added new directory to array: codedeploy-agent/a6fd13df-97f3-49db-ae6e-7dbe2e25062c"

# Print the final array
echo "Final array of directories:"
printf '%s\n' "${directories[@]}"
