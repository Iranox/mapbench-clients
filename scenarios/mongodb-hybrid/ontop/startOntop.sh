docker-compose -f ../../data/scenario/base/docker-compose.yml  -f ../../mongodb-hybrid/ontop/docker-compose.yml -f  ../../data/scenario/mongodb_hybrid/docker-compose.yml up -d
docker-compose -f ../../data/scenario/base/docker-compose.yml  -f ../../mongodb-hybrid/ontop/docker-compose.yml -f  ../../data/scenario/mongodb_hybrid/docker-compose.yml \
              run base_bsbm_generator sh /bsbm/scripts/bsbm_generator/generateData.sh $1
docker-compose -f ../../data/scenario/base/docker-compose.yml  -f ../../mongodb-hybrid/ontop/docker-compose.yml -f  ../../data/scenario/mongodb_hybrid/docker-compose.yml  \
    run base_mysql sh /bsbm/scripts/mysql/import_sql.sh

docker-compose  -f ../../data/scenario/base/docker-compose.yml  -f ../../mongodb-hybrid/ontop/docker-compose.yml -f  ../../data/scenario/mongodb_hybrid/docker-compose.yml run base_mysql mysql -u root --password=password  -s -h  base_mysql -e "ALTER TABLE review CHANGE language speech varchar(255) NOT NULL;" benchmark


docker-compose -f ../../data/scenario/base/docker-compose.yml  -f ../../mongodb-hybrid/ontop/docker-compose.yml -f  ../../data/scenario/mongodb_hybrid/docker-compose.yml \
                run mongodb_hybrid_mysql2 mysql -h  mongodb_hybrid_mysql2 -u root --password=password -e "CREATE TABLE benchmark.offer (nr INTEGER, product INTEGER, producer INTEGER, vendor INTEGER, price DOUBLE, validFrom TIMESTAMP, validTo TIMESTAMP NULL DEFAULT NULL, deliveryDays INTEGER, offerWebpage VARCHAR(100), publisher INTEGER, publishDate DATE);"

docker-compose -f ../../data/scenario/base/docker-compose.yml  -f ../../mongodb-hybrid/ontop/docker-compose.yml -f  ../../data/scenario/mongodb_hybrid/docker-compose.yml run mongodb_horizontal_mapbench-datadistributor sh /bsbm/scripts/mapbench-datadistributor/parseToMongoHybrid.sh

docker-compose -f ../../data/scenario/base/docker-compose.yml \
               -f ../../mongodb-hybrid/ontop/docker-compose.yml \
               -f  ../../data/scenario/mongodb_hybrid/docker-compose.yml \
               stop base_mysql
