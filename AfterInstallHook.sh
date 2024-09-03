#!/bin/bash

# Get the list of directories in the current directory
pwd

cd /d-IDFY3OV58/deployment-archieve
sudo apt install pm2@latest -g
pm2 start app.js
    


