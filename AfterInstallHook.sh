#!/bin/bash
set -e
cd /home/ubuntu/deploydir
npm install
npm run build
pm2 start app.js
