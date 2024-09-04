#!/bin/bash

# Get the list of directories in the current directory
pwd

rsync -avz /opt/codedeploy-agent/deployment-root/a6fd13df-97f3-49db-ae6e-7dbe2e25062c/ /home/ubuntu




#!/bin/bash

# Initialize an array to store directories starting with 'd-'
declare -a dir_array

# Function to search for directories starting with 'd-' and store them in the array
search_dirs() {
  for dir in /home/ubuntu/d-*; do
    if [ -d "$dir" ]; then
      dir_array+=("$dir")
    fi
  done
}

# Function to monitor for new directories and update the array
monitor_dirs() {
  inotifywait -m -r -e create /opt/codedeploy-agent/deployment-root/a6fd13df-97f3-49db-ae6e-7dbe2e25062| while read -r directory events filename; do
    if [[ "$filename" =~ ^d- ]] && [ -d "/home/ubuntu/$filename" ]; then
      dir_array+=("/home/ubuntu/$filename")
      echo "New directory detected: /home/ubuntu/$filename"
      cd "/home/ubuntu/$filename/deployment-archive"
      echo "Switched to the newly created directory: $(pwd)"
      
      sudo apt install pm2@latest -g
      pm2 -f stop  --update-env  app.js
      pm2 -f restart  --update-env  app.js
    fi
  done
}

# Search for initial directories
search_dirs

# Print the initial directories
echo "Initial directories starting with 'd-':"
printf '%s\n' "${dir_array[@]}"

# Print the count of initial directories
echo "Count of initial directories: ${#dir_array[@]}"

# Monitor for new directories in the background
monitor_dirs &

    


