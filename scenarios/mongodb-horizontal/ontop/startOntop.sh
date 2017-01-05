#docker-compose -f ../../data/scenario/base/docker-compose.yml  -f ../../mongodb-horizontal/ontop/docker-compose.yml -f  ../../data/scenario/mongodb_horizontal/docker-compose.yml up -d
docker-compose -f ../../data/scenario/base/docker-compose.yml  -f ../../mongodb-horizontal/ontop/docker-compose.yml -f  ../../data/scenario/mongodb_horizontal/docker-compose.yml \
              run base_bsbm_generator sh /bsbm/scripts/bsbm_generator/generateData.sh $1
docker-compose -f ../../data/scenario/base/docker-compose.yml  -f ../../mongodb-horizontal/ontop/docker-compose.yml -f  ../../data/scenario/mongodb_horizontal/docker-compose.yml  \
    run base_mysql sh /bsbm/scripts/mysql/import_sql.sh

docker-compose  -f ../../data/scenario/base/docker-compose.yml  -f ../../mongodb-horizontal/ontop/docker-compose.yml -f  ../../data/scenario/mongodb_horizontal/docker-compose.yml run base_mysql mysql -u root --password=password  -s -h  base_mysql -e "ALTER TABLE review CHANGE language speech varchar(255) NOT NULL;" benchmark


    docker-compose -f ../../data/scenario/base/docker-compose.yml  -f ../../mongodb-horizontal/ontop/docker-compose.yml -f  ../../data/scenario/mongodb_horizontal/docker-compose.yml \
                          run mysql_horizontal_mysql2  sh /bsbm/scripts/mysql/createOfferMySQL2.sh

    docker-compose -f ../../data/scenario/base/docker-compose.yml  -f ../../mongodb-horizontal/ontop/docker-compose.yml -f  ../../data/scenario/mongodb_horizontal/docker-compose.yml run mysql_horizontal_mapbench-datadistributor sh /bsbm/scripts/mapbench-datadistributor/parseToMongoDBHorizintal.sh

    docker-compose -f ../../data/scenario/base/docker-compose.yml  -f ../../mongodb-horizontal/ontop/docker-compose.yml -f  ../../data/scenario/mongodb_horizontal/docker-compose.yml stop base_mysql
