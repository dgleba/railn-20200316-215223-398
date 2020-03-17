#!/bin/bash

echo '-----------------------'
echo 'gem install mailcatcher'
gem install mailcatcher

echo '---------------------------'
echo 'mailcatcher -f --ip 0.0.0.0'
mailcatcher -f --ip 0.0.0.0
echo 'View mail at http://localhost:1080'
echo 'If you are using Docker or Vagrant, the port number may be different from 1080.'
# Send mail through smtp://localhost:1025
