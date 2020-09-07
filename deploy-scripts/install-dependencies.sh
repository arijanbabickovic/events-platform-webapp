#!/bin/bash

cd /var/www/events/deployment
yum update -y


# Installing ruby version 2.4
yum install ruby24 -y
# Installing ruby development kit (needed to build gems)
yum install ruby24-devel.x86_64 -y
# Installing c++ garbage collector (needed to build gems)
yum install gcc-c++ -y

# Setting ruby version 2.4 as default
alternatives --set ruby /usr/bin/ruby2.4
gem install bundler --bindir /usr/bin