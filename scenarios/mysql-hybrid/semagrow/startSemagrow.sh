docker-compose -f ../../data/scenario/base/docker-compose.yml  -f ../../data/scenario/mysql_hybrid/docker-compose.yml -f docker-compose.yml  up -d
sleep 60

#!/bin/bash

sleep 60
#generate sql and ttl files
docker-compose -f ../../data/scenario/base/docker-compose.yml  -f ../../data/scenario/mysql_hybrid/docker-compose.yml -f docker-compose.yml \
     run base_bsbm_generator sh /bsbm/scripts/bsbm_generator/generateData.sh $1

#sleep 60

docker-compose -f ../../data/scenario/base/docker-compose.yml  -f ../../data/scenario/mysql_hybrid/docker-compose.yml -f docker-compose.yml \
    run base_mysql sh /bsbm/scripts/mysql/import_sql.sh

docker-compose -f ../../data/scenario/base/docker-compose.yml  -f ../../data/scenario/mysql_hybrid/docker-compose.yml -f docker-compose.yml  \
    run mysql_hybrid_mysql2 mysql -h  mysql_hybrid_mysql2 -u root --password=password -e "CREATE TABLE benchmark.offer (nr INTEGER, product INTEGER, producer INTEGER, vendor INTEGER, price DOUBLE, validFrom TIMESTAMP, validTo TIMESTAMP NULL DEFAULT NULL, deliveryDays INTEGER, offerWebpage VARCHAR(100), publisher INTEGER, publishDate DATE);"

docker-compose -f ../../data/scenario/base/docker-compose.yml  -f ../../data/scenario/mysql_hybrid/docker-compose.yml -f docker-compose.yml  \
    run mysql_hybrid_mysql3 mysql -h  mysql_hybrid_mysql3 -u root --password=password -e "CREATE TABLE benchmark.offer (nr INTEGER, product INTEGER, producer INTEGER, vendor INTEGER, price DOUBLE, validFrom TIMESTAMP, validTo TIMESTAMP NULL DEFAULT NULL, deliveryDays INTEGER, offerWebpage VARCHAR(100), publisher INTEGER, publishDate DATE);"


docker-compose -f ../../data/scenario/base/docker-compose.yml  -f ../../data/scenario/mysql_hybrid/docker-compose.yml -f docker-compose.yml\
              run mysql_hybrid_mapbench-datadistributor sh /bsbm/scripts/mapbench-datadistributor/parseToMySQLHybrid.sh
