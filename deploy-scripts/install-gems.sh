#!/bin/bash 

# Go to the deployment directory
cd /var/www/events/deployment

# Get temporaray credentials for AWS CodeCommit
# - Remember that the instance must have access rights to the CodeCommit repositories in Gemfile.

# Installing RVM and Ruby
sudo yum install gcc
gpg2 --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
curl -sSL https://get.rvm.io | bash -s stable
source ~/.rvm/scripts/rvm
rvm get head
source /etc/profile.d/rvm.sh
rvm install 2.6.3

# Installing bundler
gem install bundler

# Install gems using bundler
# - Bundle location: /var/www/events/bundle
# - Binary location: /var/www/events/bin
# - Without development and test gems
# - Using gemfile in current directory
# - Also quietly. No need to generate all logs.
RAILS_ENV=production bundle install --gemfile ./Gemfile --path /var/www/events/ --without development test --deployment --quiet