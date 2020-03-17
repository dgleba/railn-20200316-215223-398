#!/bin/bash

set -e

OUTPUT_DIR='log'

file_he="$OUTPUT_DIR/1-file_list-helpers.txt"
file_mo="$OUTPUT_DIR/1-file_list-models.txt"
file_co="$OUTPUT_DIR/1-file_list-controllers.txt"
file_vi="$OUTPUT_DIR/1-file_list-views.txt"

echo '-----------------------------'
echo 'bundle exec annotate --routes'
docker-compose run --rm web bundle exec annotate --routes

echo '--------------------'
echo 'bundle exec annotate'
docker-compose run --rm web bundle exec annotate

echo '------------------------------------'
echo 'Listing the helper files in the file'
docker-compose run --rm web echo $file_he
docker-compose run --rm web echo 'This file was AUTOMATICALLY generated by the outline-short.sh script.' > $file_he
docker-compose run --rm web echo '-------------------' >> $file_he
docker-compose run --rm web echo 'HELPERS' >> $file_he
docker-compose run --rm web tree test/helpers >> $file_he
docker-compose run --rm web echo '' >> $file_he
docker-compose run --rm web tree app/helpers >> $file_he
docker-compose run --rm web echo '' >> $file_he

echo '-----------------------------------'
echo 'Listing the model files in the file'
docker-compose run --rm web echo $file_mo
docker-compose run --rm web echo 'This file was AUTOMATICALLY generated by the outline-short.sh script.' > $file_mo
docker-compose run --rm web echo '------' >> $file_mo
docker-compose run --rm web echo 'MODELS' >> $file_mo
docker-compose run --rm web tree test/models >> $file_mo
docker-compose run --rm web echo '' >> $file_mo
docker-compose run --rm web tree test/fixtures >> $file_mo
docker-compose run --rm web echo '' >> $file_mo
docker-compose run --rm web tree app/models >> $file_mo

echo '----------------------------------------'
echo 'Listing the controller files in the file'
docker-compose run --rm web echo $file_co
docker-compose run --rm web echo 'This file was AUTOMATICALLY generated by the outline-short.sh script.' > $file_co
docker-compose run --rm web echo '-----------' >> $file_co
docker-compose run --rm web echo 'CONTROLLERS' >> $file_co
docker-compose run --rm web tree test/controllers >> $file_co
docker-compose run --rm web echo '' >> $file_co
docker-compose run --rm web tree app/controllers >> $file_co

docker-compose run --rm web echo 'This file was AUTOMATICALLY generated by the outline-short.sh script.' > $file_vi
docker-compose run --rm web echo '---------------------------' >> $file_vi
docker-compose run --rm web echo 'VIEWS AND INTEGRATION TESTS' >> $file_vi
docker-compose run --rm web echo '' >> $file_vi
docker-compose run --rm web echo '----------------' >> $file_vi
docker-compose run --rm web echo 'config/routes.rb' >> $file_vi
docker-compose run --rm web cat config/routes.rb >> $file_vi
docker-compose run --rm web echo '----------------' >> $file_vi
docker-compose run --rm web tree test/integration >> $file_vi
docker-compose run --rm web echo '' >> $file_vi
docker-compose run --rm web tree app/views >> $file_vi

echo '------------------------------'
echo 'outline-short.sh OUTPUT FILES:'
echo $file_he
echo $file_mo
echo $file_co
echo $file_vi
echo
