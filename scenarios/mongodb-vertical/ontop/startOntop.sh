docker-compose -f ../../data/scenario/base/docker-compose.yml  -f ../../mongodb-vertical/ontop/docker-compose.yml -f  ../../data/scenario/mongodb_vertical/docker-compose.yml up -d
docker-compose -f ../../data/scenario/base/docker-compose.yml  -f ../../mongodb-vertical/ontop/docker-compose.yml -f  ../../data/scenario/mongodb_vertical/docker-compose.yml \
              run base_bsbm_generator sh /bsbm/scripts/bsbm_generator/generateData.sh $1
docker-compose -f ../../data/scenario/base/docker-compose.yml  -f ../../mongodb-vertical/ontop/docker-compose.yml -f  ../../data/scenario/mongodb_vertical/docker-compose.yml  \
    run base_mysql sh /bsbm/scripts/mysql/import_sql.sh

docker-compose -f ../../data/scenario/base/docker-compose.yml  -f ../../mongodb-vertical/ontop/docker-compose.yml -f  ../../data/scenario/mongodb_vertical/docker-compose.yml run base_mysql mysql -u root --password=password  -s -h  base_mysql -e "ALTER TABLE review CHANGE language speech varchar(255) NOT NULL;" benchmark


docker-compose  -f ../../data/scenario/base/docker-compose.yml  -f ../../mongodb-vertical/ontop/docker-compose.yml -f  ../../data/scenario/mongodb_vertical/docker-compose.yml run mongodb_hybrid_vertical_mapbench-datadistributor sh /bsbm/scripts/mapbench-datadistributor/pasreToMonogo.sh


docker-compose -f ../../data/scenario/base/docker-compose.yml  -f ../../mongodb-vertical/ontop/docker-compose.yml -f  ../../data/scenario/mongodb_vertical/docker-compose.yml run base_mysql mysql -u root --password=password  -s -h  base_mysql -e "DROP TABLE IF EXISTS person" benchmark
docker-compose -f ../../data/scenario/base/docker-compose.yml  -f ../../mongodb-vertical/ontop/docker-compose.yml -f  ../../data/scenario/mongodb_vertical/docker-compose.yml run base_mysql mysql -u root --password=password  -s -h  base_mysql -e "DROP TABLE IF EXISTS review" benchmark
docker-compose -f ../../data/scenario/base/docker-compose.yml  -f ../../mongodb-vertical/ontop/docker-compose.yml -f  ../../data/scenario/mongodb_vertical/docker-compose.yml run base_mysql mysql -u root --password=password  -s -h  base_mysql -e "DROP TABLE IF EXISTS offer" benchmark
docker-compose -f ../../data/scenario/base/docker-compose.yml  -f ../../mongodb-vertical/ontop/docker-compose.yml -f  ../../data/scenario/mongodb_vertical/docker-compose.yml run base_mysql mysql -u root --password=password  -s -h  base_mysql -e "DROP TABLE IF EXISTS productfeature" benchmark
docker-compose -f ../../data/scenario/base/docker-compose.yml  -f ../../mongodb-vertical/ontop/docker-compose.yml -f  ../../data/scenario/mongodb_vertical/docker-compose.yml run base_mysql mysql -u root --password=password  -s -h  base_mysql  -e "DROP TABLE IF EXISTS productfeatureproduct" benchmark
