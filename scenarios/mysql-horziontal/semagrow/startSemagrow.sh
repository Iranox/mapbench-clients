docker-compose -f ../../data/scenario/base/docker-compose.yml  -f ../../data/scenario/mysql_horizontal/docker-compose.yml -f docker-compose.yml  up -d
sleep 60

#generate data
docker-compose -f ../../data/scenario/base/docker-compose.yml  -f ../../data/scenario/mysql_horizontal/docker-compose.yml -f docker-compose.yml \
     run base_bsbm_generator sh /bsbm/scripts/bsbm_generator/generateData.sh $1

# import to mysql
docker-compose -f ../../data/scenario/base/docker-compose.yml  -f ../../data/scenario/mysql_horizontal/docker-compose.yml -f docker-compose.yml \
    run base_mysql sh /bsbm/scripts/mysql/import_sql.sh


docker-compose -f ../../data/scenario/base/docker-compose.yml  -f ../../data/scenario/mysql_horizontal/docker-compose.yml -f docker-compose.yml \
    run mysql_horizontal_mysql2  sh /bsbm/scripts/mysql/createOfferMySQL2.sh

docker-compose -f ../../data/scenario/base/docker-compose.yml  -f ../../data/scenario/mysql_horizontal/docker-compose.yml -f docker-compose.yml \
    run mysql_horizontal_mysql3 sh /bsbm/scripts/mysql/createOfferMySQL3.sh

docker-compose -f ../../data/scenario/base/docker-compose.yml  -f ../../data/scenario/mysql_horizontal/docker-compose.yml -f docker-compose.yml \
    run mysql_horizontal_mapbench-datadistributor sh /bsbm/scripts/mapbench-datadistributor/parseToMySQlHorizintal.sh

docker-compose -f ../../data/scenario/base/docker-compose.yml  -f ../../data/scenario/mysql_horizontal/docker-compose.yml -f docker-compose.yml  stop base_mysql
