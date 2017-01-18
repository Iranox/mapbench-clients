docker-compose -f ../../data/scenario/base/docker-compose.yml -f docker-compose.yml up -d
sleep 60
docker-compose -f  ../../data/scenario/base/docker-compose.yml  -f docker-compose.yml \
     run base_bsbm_generator sh /bsbm/scripts/bsbm_generator/generateData.sh $1
docker-compose -f  ../../data/scenario/base/docker-compose.yml  -f docker-compose.yml \
    run base_mysql sh /bsbm/scripts/mysql/import_sql.sh
