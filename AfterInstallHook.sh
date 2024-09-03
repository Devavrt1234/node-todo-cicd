#!/bin/bash

# Get the list of directories in the current directory
#directories="/opt/codedeploy-agent/deployment-root/a6fd13df-97f3-49db-ae6e-7dbe2e25062c"

# Get the newest directory
#newest_dir=$(printf "%s\n" "${directories[@]}" | sort -n | tail -1)

# Rsync the newest directory to /home/ubuntu
#rsync -avz "$newest_dir"/ /home/ubuntu/


directories=("d-9NW56YU58" "d-IC8AAUU58" "d-IDFY3OV58" "d-OFYXVNU58" "d-X7Y347V58")

for dir in "${directories[@]}"; do
  if [ -d "$dir" ]; then
    cd "$dir"
    cd deployment-archive
    sudo apt install pm2@latest -g
    pm2 status
    pm2 list
    pm2 app.js
    break
  fi
done

new_dir=$(find . -type d -not -name "${directories[@]}" -print -quit)

if [ -n "$new_dir" ]; then
  for dir in "${directories[@]}"; do
    rm -rf "$dir"
  done
  cd "$new_dir"
  node app.js
fi
