#!/bin/bash 

# Load environment variables
source /etc/profile

# Go to the deployment directory
cd /var/www/events/deployment

# Run migrations in production
RAILS_ENV=production bundle exec rake db:migrate