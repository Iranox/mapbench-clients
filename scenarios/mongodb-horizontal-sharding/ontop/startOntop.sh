#docker-compose -f ../../data/scenario/base/docker-compose.yml  -f ../../mongodb-horizontal-sharding/ontop/docker-compose.yml -f  ../../data/scenario/mongodb_horizontal_shard/docker-compose.yml up -d
docker-compose -f ../../data/scenario/base/docker-compose.yml  -f ../../mongodb-horizontal-sharding/ontop/docker-compose.yml -f  ../../data/scenario/mongodb_horizontal_shard/docker-compose.yml \
              run base_bsbm_generator sh /bsbm/scripts/bsbm_generator/generateData.sh $1
docker-compose -f ../../data/scenario/base/docker-compose.yml  -f ../../mongodb-horizontal-sharding/ontop/docker-compose.yml -f  ../../data/scenario/mongodb_horizontal_shard/docker-compose.yml  \
    run base_mysql sh /bsbm/scripts/mysql/import_sql.sh

docker-compose  -f ../../data/scenario/base/docker-compose.yml  -f ../../mongodb-horizontal-sharding/ontop/docker-compose.yml -f  ../../data/scenario/mongodb_horizontal_shard/docker-compose.yml run base_mysql mysql -u root --password=password  -s -h  base_mysql -e "ALTER TABLE review CHANGE language speech varchar(255) NOT NULL;" benchmark


    docker-compose -f ../../data/scenario/base/docker-compose.yml  -f ../../mongodb-horizontal-sharding/ontop/docker-compose.yml -f  ../../data/scenario/mongodb_horizontal_shard/docker-compose.yml \
                          run mysql_horizontal_mysql2  mysql -h  mysql_horizontal_mysql2 -u root --password=password -e "CREATE TABLE benchmark.offer (nr INTEGER, product INTEGER, producer INTEGER, vendor INTEGER, price DOUBLE, validFrom TIMESTAMP, validTo TIMESTAMP NULL DEFAULT NULL, deliveryDays INTEGER, offerWebpage VARCHAR(100), publisher INTEGER, publishDate DATE);"

  docker-compose -f ../../data/scenario/base/docker-compose.yml  -f ../../mongodb-horizontal-sharding/ontop/docker-compose.yml -f  ../../data/scenario/mongodb_horizontal_shard/docker-compose.yml \
     run  mongo-rs1-horizontal sh /bsbm/scripts/mongodb/horizontal/mongoReplica.sh

     docker-compose -f ../../data/scenario/base/docker-compose.yml  -f ../../mongodb-horizontal-sharding/ontop/docker-compose.yml -f  ../../data/scenario/mongodb_horizontal_shard/docker-compose.yml \
        run  mongo-rs2-horizontal sh /bsbm/scripts/mongodb/horizontal/mongoReplica2.sh

        docker-compose -f ../../data/scenario/base/docker-compose.yml  -f ../../mongodb-horizontal-sharding/ontop/docker-compose.yml -f  ../../data/scenario/mongodb_horizontal_shard/docker-compose.yml \
           run  mongo-rs3-horizontal sh /bsbm/scripts/mongodb/horizontal/mongoReplica3.sh

  docker-compose -f ../../data/scenario/base/docker-compose.yml  -f ../../mongodb-horizontal-sharding/ontop/docker-compose.yml -f  ../../data/scenario/mongodb_horizontal_shard/docker-compose.yml \
          run  mongo-master-horizontal sh /bsbm/scripts/mongodb/addShardsHorizontal.sh

  docker-compose -f ../../data/scenario/base/docker-compose.yml  -f ../../mongodb-horizontal-sharding/ontop/docker-compose.yml -f  ../../data/scenario/mongodb_horizontal_shard/docker-compose.yml run  mongodb_vertical_mapbench-datadistributor sh /bsbm/scripts/mapbench-datadistributor/parseToMonodbHorizontalShard.sh

  docker-compose -f ../../data/scenario/base/docker-compose.yml  -f ../../mongodb-horizontal-sharding/ontop/docker-compose.yml -f  ../../data/scenario/mongodb_horizontal_shard/docker-compose.yml \
        run mysql_horizontal_mysql2  mysql -h  base_mysql -u root --password=password -e "DROP DATABASE benchmark;"


  docker-compose -f ../../data/scenario/base/docker-compose.yml  -f ../../mongodb-horizontal-sharding/ontop/docker-compose.yml -f  ../../data/scenario/mongodb_horizontal_shard/docker-compose.yml stop base_mysql

  docker-compose -f ../../data/scenario/base/docker-compose.yml  -f ../../mongodb-horizontal-sharding/ontop/docker-compose.yml -f  ../../data/scenario/mongodb_horizontal_shard/docker-compose.yml stop teiid

  docker-compose -f ../../data/scenario/base/docker-compose.yml  -f ../../mongodb-horizontal-sharding/ontop/docker-compose.yml -f  ../../data/scenario/mongodb_horizontal_shard/docker-compose.yml start teiid
