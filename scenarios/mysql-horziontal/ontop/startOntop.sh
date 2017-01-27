#docker-compose -f ../../data/scenario/base/docker-compose.yml  -f ../../mysql-horziontal/ontop/docker-compose.yml -f  ../../data/scenario/mysql_horizontal/docker-compose.yml up -d
#sleep 60
docker-compose -f ../../data/scenario/base/docker-compose.yml  -f ../../mysql-horziontal/ontop/docker-compose.yml -f  ../../data/scenario/mysql_horizontal/docker-compose.yml \
              run base_bsbm_generator sh /bsbm/scripts/bsbm_generator/generateData.sh $1
docker-compose -f ../../data/scenario/base/docker-compose.yml  -f ../../mysql-horziontal/ontop/docker-compose.yml -f  ../../data/scenario/mysql_horizontal/docker-compose.yml  \
    run base_mysql sh /bsbm/scripts/mysql/import_sql.sh

docker-compose  -f ../../data/scenario/base/docker-compose.yml  -f ../../mysql-horziontal/ontop/docker-compose.yml -f  ../../data/scenario/mysql_horizontal/docker-compose.yml run base_mysql mysql -u root --password=password  -s -h  base_mysql -e "ALTER TABLE review CHANGE language speech varchar(255) NOT NULL;" benchmark


    docker-compose -f ../../data/scenario/base/docker-compose.yml  -f ../../mysql-horziontal/ontop/docker-compose.yml -f  ../../data/scenario/mysql_horizontal/docker-compose.yml \
                          run mysql_horizontal_mysql2  sh /bsbm/scripts/mysql/createOfferMySQL2.sh
    docker-compose -f ../../data/scenario/base/docker-compose.yml  -f ../../mysql-horziontal/ontop/docker-compose.yml -f  ../../data/scenario/mysql_horizontal/docker-compose.yml \
                          run mysql_horizontal_mysql3  sh /bsbm/scripts/mysql/createOfferMySQL3.sh


    docker-compose -f ../../data/scenario/base/docker-compose.yml  -f ../../mysql-horziontal/ontop/docker-compose.yml -f  ../../data/scenario/mysql_horizontal/docker-compose.yml run mysql_horizontal_mapbench-datadistributor sh /bsbm/scripts/mapbench-datadistributor/parseToMySQlHorizintal.sh

    docker-compose -f ../../data/scenario/base/docker-compose.yml  -f ../../mysql-horziontal/ontop/docker-compose.yml -f  ../../data/scenario/mysql_horizontal/docker-compose.yml run base_mysql mysql -u root --password=password  -s -h  base_mysql -e "DROP database benchmark" benchmark
    docker-compose -f ../../data/scenario/base/docker-compose.yml  -f ../../mysql-horziontal/ontop/docker-compose.yml -f  ../../data/scenario/mysql_horizontal/docker-compose.yml run base_mysql mysql -u root --password=password  -s -h  base_mysql -e "CREATE database benchmark"
    docker-compose -f ../../data/scenario/base/docker-compose.yml  -f ../../mysql-horziontal/ontop/docker-compose.yml -f  ../../data/scenario/mysql_horizontal/docker-compose.yml stop base_mysql

docker-compose -f ../../data/scenario/base/docker-compose.yml  -f ../../mysql-horziontal/ontop/docker-compose.yml -f  ../../data/scenario/mysql_horizontal/docker-compose.yml stop teiid
docker-compose -f ../../data/scenario/base/docker-compose.yml  -f ../../mysql-horziontal/ontop/docker-compose.yml -f  ../../data/scenario/mysql_horizontal/docker-compose.yml start teiid
docker-compose -f ../../data/scenario/base/docker-compose.yml  -f ../../mysql-horziontal/ontop/docker-compose.yml -f  ../../data/scenario/mysql_horizontal/docker-compose.yml stop ontop
docker-compose -f ../../data/scenario/base/docker-compose.yml  -f ../../mysql-horziontal/ontop/docker-compose.yml -f  ../../data/scenario/mysql_horizontal/docker-compose.yml start ontop
