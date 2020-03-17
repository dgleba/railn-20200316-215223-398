#!/bin/bash

# NOTE: This script is executed within Docker.

DB_ROOT=$1
DB_USERNAME=$2
DB_PASSWORD=$3

echo '----------------------'
echo 'bundle install --quiet'
bundle install --quiet

gem install line_containing
gem install remove_double_blank
gem install string_in_file
gem install gemfile_entry

ruby pg_setup.rb $DB_ROOT $DB_USERNAME $DB_PASSWORD
