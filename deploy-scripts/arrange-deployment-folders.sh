#!/bin/bash 

# Remove if previous deployment folder exists
rm -rf /var/www/events/prev-deployment

# Backup current deployment 
mv /var/www/events/deployment /var/www/events/prev-deployment

# Create new deployment folder and make nginx owner
mkdir /var/www/events/deployment

chown nginx:nginx /var/www/events/deployment

mkdir /var/www/events/deployment/config