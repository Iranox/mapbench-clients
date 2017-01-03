docker-compose -f ../../data/scenario/base/docker-compose.yml  -f ../../mongodb-vertical-sharding/ontop/docker-compose.yml -f  ../../data/scenario/mongodb_vertical_shard/docker-compose.yml up -d
sleep 30
docker-compose -f ../../data/scenario/base/docker-compose.yml  -f ../../mongodb-vertical-sharding/ontop/docker-compose.yml -f  ../../data/scenario/mongodb_vertical_shard/docker-compose.yml \
              run base_bsbm_generator sh /bsbm/scripts/bsbm_generator/generateData.sh $1

docker-compose -f ../../data/scenario/base/docker-compose.yml  -f ../../mongodb-vertical-sharding/ontop/docker-compose.yml -f  ../../data/scenario/mongodb_vertical_shard/docker-compose.yml  \
    run base_mysql sh /bsbm/scripts/mysql/import_sql.sh

docker-compose -f ../../data/scenario/base/docker-compose.yml  -f ../../mongodb-vertical-sharding/ontop/docker-compose.yml -f  ../../data/scenario/mongodb_vertical_shard/docker-compose.yml run base_mysql mysql -u root --password=password  -s -h  base_mysql -e "ALTER TABLE review CHANGE language speech varchar(255) NOT NULL;" benchmark




docker-compose -f ../../data/scenario/base/docker-compose.yml  -f ../../mongodb-vertical-sharding/ontop/docker-compose.yml -f  ../../data/scenario/mongodb_vertical_shard/docker-compose.yml  \
     run mongo-rs1 sh /bsbm/scripts/mongodb/mongoReplica.sh

docker-compose -f ../../data/scenario/base/docker-compose.yml  -f ../../mongodb-vertical-sharding/ontop/docker-compose.yml -f  ../../data/scenario/mongodb_vertical_shard/docker-compose.yml  \
    run mongo-rs2 sh /bsbm/scripts/mongodb/mongoReplica2.sh

docker-compose -f ../../data/scenario/base/docker-compose.yml  -f ../../mongodb-vertical-sharding/ontop/docker-compose.yml -f  ../../data/scenario/mongodb_vertical_shard/docker-compose.yml  \
      run mongo-rs3 sh /bsbm/scripts/mongodb/mongoReplica3.sh

docker-compose -f ../../data/scenario/base/docker-compose.yml  -f ../../mongodb-vertical-sharding/ontop/docker-compose.yml -f  ../../data/scenario/mongodb_vertical_shard/docker-compose.yml  \
          run mongo-master sh /bsbm/scripts/mongodb/addShards.sh

docker-compose -f ../../data/scenario/base/docker-compose.yml  -f ../../mongodb-vertical-sharding/ontop/docker-compose.yml -f  ../../data/scenario/mongodb_vertical_shard/docker-compose.yml  \
          run mongo-master sh /bsbm/scripts/mongodb/addShardsVertical.sh

# copy tables to mongodb
docker-compose -f ../../data/scenario/base/docker-compose.yml  -f ../../mongodb-vertical-sharding/ontop/docker-compose.yml -f  ../../data/scenario/mongodb_vertical_shard/docker-compose.yml  run mongodb_vertical_mapbench-datadistributor sh /bsbm/scripts/mapbench-datadistributor/pasreToMonogoShard.sh

docker-compose -f ../../data/scenario/base/docker-compose.yml  -f ../../mongodb-vertical-sharding/ontop/docker-compose.yml -f  ../../data/scenario/mongodb_vertical_shard/docker-compose.yml run base_mysql mysql -u root --password=password  -s -h  base_mysql -e "DROP TABLE IF EXISTS person" benchmark
docker-compose -f ../../data/scenario/base/docker-compose.yml  -f ../../mongodb-vertical-sharding/ontop/docker-compose.yml -f  ../../data/scenario/mongodb_vertical_shard/docker-compose.yml run base_mysql mysql -u root --password=password  -s -h  base_mysql -e "DROP TABLE IF EXISTS review" benchmark
docker-compose -f ../../data/scenario/base/docker-compose.yml  -f ../../mongodb-vertical-sharding/ontop/docker-compose.yml -f  ../../data/scenario/mongodb_vertical_shard/docker-compose.yml run base_mysql mysql -u root --password=password  -s -h  base_mysql -e "DROP TABLE IF EXISTS offer" benchmark
docker-compose -f ../../data/scenario/base/docker-compose.yml  -f ../../mongodb-vertical-sharding/ontop/docker-compose.yml -f  ../../data/scenario/mongodb_vertical_shard/docker-compose.yml run base_mysql mysql -u root --password=password  -s -h  base_mysql -e "DROP TABLE IF EXISTS productfeature" benchmark
docker-compose -f ../../data/scenario/base/docker-compose.yml  -f ../../mongodb-vertical-sharding/ontop/docker-compose.yml -f  ../../data/scenario/mongodb_vertical_shard/docker-compose.yml run base_mysql mysql -u root --password=password  -s -h  base_mysql  -e "DROP TABLE IF EXISTS productfeatureproduct" benchmark

docker-compose -f ../../data/scenario/base/docker-compose.yml  -f ../../mongodb-vertical-sharding/ontop/docker-compose.yml -f  ../../data/scenario/mongodb_vertical_shard/docker-compose.yml stop teiid
docker-compose -f ../../data/scenario/base/docker-compose.yml  -f ../../mongodb-vertical-sharding/ontop/docker-compose.yml -f  ../../data/scenario/mongodb_vertical_shard/docker-compose.yml start teiid
