#!/bin/bash

#PREP
USER_HOST="bholt@myserver.com"
REMOTE_DIR="~/web/myproj"
set -e #exit on any error
git pull

#LOCAL
#run tests
#bundle exec rake test
#clear temp files
bundle exec rake tmp:clear
#precompile assets
bundle exec rake assets:precompile
#copy files
rsync -rvuz ./ ${USER_HOST}:${REMOTE_DIR} --exclude='.git/' --exclude='log/' --exclude='tmp/cache' --delete
#clear tmp files after precompile
bundle exec rake tmp:clear

#REMOTE
#bundle install
ssh ${USER_HOST} 'cd ${REMOTE_DIR} && bundle install'
#database migrate
ssh ${USER_HOST} 'cd ${REMOTE_DIR} && bundle exec rake db:migrate RAILS_ENV="production"'
#clear temp files
ssh ${USER_HOST} 'cd ${REMOTE_DIR} && bundle exec rake tmp:clear'
#clear log files
ssh ${USER_HOST} 'cd ${REMOTE_DIR} && bundle exec rake log:clear'
#restart app
ssh ${USER_HOST} 'touch ${REMOTE_DIR}/tmp/restart.txt'

echo "Deploy Successful!"