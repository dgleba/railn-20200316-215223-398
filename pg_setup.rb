# rubocop:disable Layout/LineLength

require 'line_containing'
require 'remove_double_blank'
require 'string_in_file'
require 'gemfile_entry'

# Get input arguments (called by Bash script)
db_name_root = ARGV[0]
username_x = ARGV[1]
password_x = ARGV[2]

# Update the Dockerfile to remove SQLite (no longer needed)
StringInFile.replace(' sqlite3', '', 'Dockerfile')
StringInFile.replace(' libsqlite3-dev', '', 'Dockerfile')

# Remove "#POSTGRES#" in .gitignore
StringInFile.replace('#POSTGRES#', '', '.gitignore')

# Remove "#POSTGRES#" in docker-compose.yml
StringInFile.replace('#POSTGRES#', '', 'docker-compose.yml')

# Remove "#POSTGRES#" in bin/dmigrate and keep it executable
StringInFile.replace('#POSTGRES#', '', 'bin/dmigrate')
system('wait')
system('chmod +x bin/dmigrate')

# Remove "#POSTGRES#" in bin/dinfo and keep it executable
StringInFile.replace('#POSTGRES#', '', 'bin/dinfo')
system('wait')
system('chmod +x bin/dinfo')

# Remove the SQLite section in the Gemfile
LineContaining.delete_between_plus('# BEGIN: SQLite', '# END: SQLite', 'Gemfile')
RemoveDoubleBlank.update('Gemfile')

# Update the pg section in the Gemfile
# (pg for all environments, not just production)
LineContaining.delete_between('# BEGIN: pg section', '# END: pg section', 'Gemfile')
LineContaining.add_after('# BEGIN: pg section', "gem 'pg'", 'Gemfile')
system('bundle install --quiet')
StringInFile.replace("gem 'pg'", GemfileEntry.active('pg'), 'Gemfile')

puts 'git rm config/database.yml'
system('git rm config/database.yml')

puts 'Configure config/database.yml'
system('cp config/database-pg.yml config/database.yml')
system('wait')

puts 'Configure .env/development/database'
system('cp .env/development/database-template .env/development/database')
system('wait')
StringInFile.replace('POSTGRES_DB_1', db_name_root, '.env/development/database')
StringInFile.replace('POSTGRES_USER_1', username_x, '.env/development/database')
StringInFile.replace('POSTGRES_PASSWORD_1', password_x, '.env/development/database')

puts 'Configure init.sql'
system('cp init.sql.template init.sql')
system('wait')
StringInFile.replace('POSTGRES_USER_1', username_x, 'init.sql')
StringInFile.replace('POSTGRES_PASSWORD_1', password_x, 'init.sql')
system('wait')
system('chmod +x init.sql')

# rubocop:enable Layout/LineLength
