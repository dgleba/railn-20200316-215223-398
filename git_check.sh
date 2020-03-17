#!/bin/bash

# Run this script before entering "git add" and "git commit".

sh test_app.sh

bin/dbrakeman
bin/dcop
bin/drbp

echo '----------'
echo 'git status'
git status
