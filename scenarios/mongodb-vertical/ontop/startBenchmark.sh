docker-compose -f ../../data/scenario/base/docker-compose.yml  -f ../../mongodb-vertical/ontop/docker-compose.yml -f  ../../data/scenario/mongodb_vertical/docker-compose.yml  \
run base_bsbm_generator ./testdriver http://ontop:8080/openrdf-workbench/repositories/1/query \
   -idir data/benchmark/sql/td_data \
   -runs 100 \
    -w 50 \
   -ucf /bsbm/scripts/bsbm_generator/sparql_ontop.txt \
#   -o results/benchmark_mongodb_vertical_1millionen.xml
#docker-compose -f ../../data/scenario/base/docker-compose.yml  -f ../../mongodb-vertical/ontop/docker-compose.yml -f  ../../data/scenario/mongodb_vertical/docker-compose.yml  \
#             run base_bsbm_generator rm -r /bsbm/data/benchmark/sql/td_data
#docker-compose -f ../../data/scenario/base/docker-compose.yml  -f ../../mongodb-vertical/ontop/docker-compose.yml -f  ../../data/scenario/mongodb_vertical/docker-compose.yml \#
#             run base_bsbm_generator rm /bsbm/data/benchmark/sql/*
#docker-compose -f ../../data/scenario/base/docker-compose.yml  -f ../../mongodb-vertical/ontop/docker-compose.yml -f  ../../data/scenario/mongodb_vertical/docker-compose.yml \
#  run mongodb_hybrid_vertical_mongodb run mongo -host mongodb_hybrid_vertical_mongodb benchmark  -eval 'db.dropDatabase()'
#docker-compose -f ../../data/scenario/base/docker-compose.yml  -f ../../mongodb-vertical/ontop/docker-compose.yml -f  ../../data/scenario/mongodb_vertical/docker-compose.yml \
#  run base_bsbm_generator sh /bsbm/scripts/bsbm_generator/generateData.sh 28480
#  docker-compose -f ../../data/scenario/base/docker-compose.yml  -f ../../mongodb-vertical/ontop/docker-compose.yml -f  ../../data/scenario/mongodb_vertical/docker-compose.yml  \
#      run base_mysql sh /bsbm/scripts/mysql/import_sql.sh

#  docker-compose -f ../../data/scenario/base/docker-compose.yml  -f ../../mongodb-vertical/ontop/docker-compose.yml -f  ../../data/scenario/mongodb_vertical/docker-compose.yml run base_mysql mysql -u root --password=password  -s -h  base_mysql -e "ALTER TABLE review CHANGE language speech varchar(255) NOT NULL;" benchmark


#  docker-compose  -f ../../data/scenario/base/docker-compose.yml  -f ../../mongodb-vertical/ontop/docker-compose.yml -f  ../../data/scenario/mongodb_vertical/docker-compose.yml run mongodb_hybrid_vertical_mapbench-datadistributor sh /bsbm/scripts/mapbench-datadistributor/pasreToMonogo.sh


#  docker-compose -f ../../data/scenario/base/docker-compose.yml  -f ../../mongodb-vertical/ontop/docker-compose.yml -f  ../../data/scenario/mongodb_vertical/docker-compose.yml run base_mysql mysql -u root --password=password  -s -h  base_mysql -e "DROP TABLE IF EXISTS person" benchmark
#  docker-compose -f ../../data/scenario/base/docker-compose.yml  -f ../../mongodb-vertical/ontop/docker-compose.yml -f  ../../data/scenario/mongodb_vertical/docker-compose.yml run base_mysql mysql -u root --password=password  -s -h  base_mysql -e "DROP TABLE IF EXISTS review" benchmark
#  docker-compose -f ../../data/scenario/base/docker-compose.yml  -f ../../mongodb-vertical/ontop/docker-compose.yml -f  ../../data/scenario/mongodb_vertical/docker-compose.yml run base_mysql mysql -u root --password=password  -s -h  base_mysql -e "DROP TABLE IF EXISTS offer" benchmark
#  docker-compose -f ../../data/scenario/base/docker-compose.yml  -f ../../mongodb-vertical/ontop/docker-compose.yml -f  ../../data/scenario/mongodb_vertical/docker-compose.yml run base_mysql mysql -u root --password=password  -s -h  base_mysql -e "DROP TABLE IF EXISTS productfeature" benchmark
#  docker-compose -f ../../data/scenario/base/docker-compose.yml  -f ../../mongodb-vertical/ontop/docker-compose.yml -f  ../../data/scenario/mongodb_vertical/docker-compose.yml run base_mysql mysql -u root --password=password  -s -h  base_mysql  -e "DROP TABLE IF EXISTS productfeatureproduct" benchmark
#  docker-compose -f ../../data/scenario/base/docker-compose.yml  -f ../../mongodb-vertical/ontop/docker-compose.yml -f  ../../data/scenario/mongodb_vertical/docker-compose.yml  \
#  run base_bsbm_generator ./testdriver http://ontop:8080/openrdf-workbench/repositories/1/query \
#     -idir data/benchmark/sql/td_data \
#     -runs 100 \
#      -w 50 \
#     -ucf /bsbm/scripts/bsbm_generator/sparql_ontop.txt \
#     -o results/benchmark_mongodb_vertical_10millionen.xml
#  docker-compose -f ../../data/scenario/base/docker-compose.yml  -f ../../mongodb-vertical/ontop/docker-compose.yml -f  ../../data/scenario/mongodb_vertical/docker-compose.yml  \
#               run base_bsbm_generator rm -r /bsbm/data/benchmark/sql/td_data
#  docker-compose -f ../../data/scenario/base/docker-compose.yml  -f ../../mongodb-vertical/ontop/docker-compose.yml -f  ../../data/scenario/mongodb_vertical/docker-compose.yml \
#               run base_bsbm_generator rm /bsbm/data/benchmark/sql/*
#  docker-compose -f ../../data/scenario/base/docker-compose.yml  -f ../../mongodb-vertical/ontop/docker-compose.yml -f  ../../data/scenario/mongodb_vertical/docker-compose.yml \
#    run mongodb_hybrid_vertical_mongodb run mongo -host mongodb_hybrid_vertical_mongodb benchmark  -eval 'db.dropDatabase()'
#  docker-compose -f ../../data/scenario/base/docker-compose.yml  -f ../../mongodb-vertical/ontop/docker-compose.yml -f  ../../data/scenario/mongodb_vertical/docker-compose.yml \
#    run base_bsbm_generator sh /bsbm/scripts/bsbm_generator/generateData.sh 284800
#    docker-compose -f ../../data/scenario/base/docker-compose.yml  -f ../../mongodb-vertical/ontop/docker-compose.yml -f  ../../data/scenario/mongodb_vertical/docker-compose.yml  \
#        run base_mysql sh /bsbm/scripts/mysql/import_sql.sh
#
#    docker-compose -f ../../data/scenario/base/docker-compose.yml  -f ../../mongodb-vertical/ontop/docker-compose.yml -f  ../../data/scenario/mongodb_vertical/docker-compose.yml run base_mysql mysql -u root --password=password  -s -h  base_mysql -e "ALTER TABLE review CHANGE language speech varchar(255) NOT NULL;" benchmark


#    docker-compose  -f ../../data/scenario/base/docker-compose.yml  -f ../../mongodb-vertical/ontop/docker-compose.yml -f  ../../data/scenario/mongodb_vertical/docker-compose.yml run mongodb_hybrid_vertical_mapbench-datadistributor sh /bsbm/scripts/mapbench-datadistributor/pasreToMonogo.sh


#    docker-compose -f ../../data/scenario/base/docker-compose.yml  -f ../../mongodb-vertical/ontop/docker-compose.yml -f  ../../data/scenario/mongodb_vertical/docker-compose.yml run base_mysql mysql -u root --password=password  -s -h  base_mysql -e "DROP TABLE IF EXISTS person" benchmark
#    docker-compose -f ../../data/scenario/base/docker-compose.yml  -f ../../mongodb-vertical/ontop/docker-compose.yml -f  ../../data/scenario/mongodb_vertical/docker-compose.yml run base_mysql mysql -u root --password=password  -s -h  base_mysql -e "DROP TABLE IF EXISTS review" benchmark
#    docker-compose -f ../../data/scenario/base/docker-compose.yml  -f ../../mongodb-vertical/ontop/docker-compose.yml -f  ../../data/scenario/mongodb_vertical/docker-compose.yml run base_mysql mysql -u root --password=password  -s -h  base_mysql -e "DROP TABLE IF EXISTS offer" benchmark
#    docker-compose -f ../../data/scenario/base/docker-compose.yml  -f ../../mongodb-vertical/ontop/docker-compose.yml -f  ../../data/scenario/mongodb_vertical/docker-compose.yml run base_mysql mysql -u root --password=password  -s -h  base_mysql -e "DROP TABLE IF EXISTS productfeature" benchmark
#    docker-compose -f ../../data/scenario/base/docker-compose.yml  -f ../../mongodb-vertical/ontop/docker-compose.yml -f  ../../data/scenario/mongodb_vertical/docker-compose.yml run base_mysql mysql -u root --password=password  -s -h  base_mysql  -e "DROP TABLE IF EXISTS productfeatureproduct" benchmark

#    docker-compose -f ../../data/scenario/base/docker-compose.yml  -f ../../mongodb-vertical/ontop/docker-compose.yml -f  ../../data/scenario/mongodb_vertical/docker-compose.yml  \
#    run base_bsbm_generator ./testdriver http://ontop:8080/openrdf-workbench/repositories/1/query \
#       -idir data/benchmark/sql/td_data \
#       -runs 1 \
#        -w 1 \
#       -ucf /bsbm/scripts/bsbm_generator/sparql_ontop.txt \
#       -o results/benchmark_mongodb_vertical_100millionen.xml
