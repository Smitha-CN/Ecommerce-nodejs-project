#!/bin/bash
yum update -y
curl -sL https://rpm.nodesource.com/setup_18.x | bash -
yum install -y nodejs git
git clone https://github.com/Smitha-CN/sample.git /home/ec2-user/app
cd /home/ec2-user/app/backend
npm install
npm install -g pm2
pm2 start server.js
pm2 startup
pm2 save
