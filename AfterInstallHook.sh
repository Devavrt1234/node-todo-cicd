#!/bin/bash
set -e
cd /home/ubuntu
npm install
npm run build
pm2 start app.js
