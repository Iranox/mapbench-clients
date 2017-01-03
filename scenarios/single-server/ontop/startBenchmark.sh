docker-compose -f ../../data/scenario/base/docker-compose.yml -f docker-compose.yml \
run base_bsbm_generator ./testdriver http://ontop:8080/openrdf-workbench/repositories/1/query \
                     -idir data/benchmark/sql/td_data \
                     -runs 100 \
                      -w 50 \
                     -ucf /bsbm/scripts/bsbm_generator/sparql_ontop.txt \
                     -o results/benchmark_1millionen_singleServer.xml
docker-compose -f ../../data/scenario/base/docker-compose.yml -f docker-compose.yml \
          run base_bsbm_generator rm -r /bsbm/data/benchmark/sql/td_data
docker-compose -f ../../data/scenario/base/docker-compose.yml -f docker-compose.yml \
          run base_bsbm_generator rm /bsbm/data/benchmark/sql/*
docker-compose -f ../../data/scenario/base/docker-compose.yml  -f ../../mongodb-vertical/ontop/docker-compose.yml -f  ../../data/scenario/mongodb_vertical/docker-compose.yml \
                        run base_bsbm_generator sh /bsbm/scripts/bsbm_generator/generateData.sh 28480
docker-compose -f ../../data/scenario/base/docker-compose.yml  -f ../../mongodb-vertical/ontop/docker-compose.yml -f  ../../data/scenario/mongodb_vertical/docker-compose.yml  \
              run base_mysql sh /bsbm/scripts/mysql/import_sql.sh
docker-compose -f ../../data/scenario/base/docker-compose.yml -f docker-compose.yml \
              run base_bsbm_generator ./testdriver http://ontop:8080/openrdf-workbench/repositories/1/query \
                                   -idir data/benchmark/sql/td_data \
                                   -runs 100 \
                                    -w 50 \
                                   -ucf /bsbm/scripts/bsbm_generator/sparql_ontop.txt \
                                   -o results/benchmark_10millionen_singleServer.xml
docker-compose -f ../../data/scenario/base/docker-compose.yml -f docker-compose.yml \
              run base_bsbm_generator rm -r /bsbm/data/benchmark/sql/td_data
docker-compose -f ../../data/scenario/base/docker-compose.yml -f docker-compose.yml \
                        run base_bsbm_generator rm /bsbm/data/benchmark/sql/*
docker-compose -f ../../data/scenario/base/docker-compose.yml  -f ../../mongodb-vertical/ontop/docker-compose.yml -f  ../../data/scenario/mongodb_vertical/docker-compose.yml \
                                      run base_bsbm_generator sh /bsbm/scripts/bsbm_generator/generateData.sh 284800
docker-compose -f ../../data/scenario/base/docker-compose.yml  -f ../../mongodb-vertical/ontop/docker-compose.yml -f  ../../data/scenario/mongodb_vertical/docker-compose.yml  \
                            run base_mysql sh /bsbm/scripts/mysql/import_sql.sh
docker-compose -f ../../data/scenario/base/docker-compose.yml -f docker-compose.yml \
                                          run base_bsbm_generator ./testdriver http://ontop:8080/openrdf-workbench/repositories/1/query \
                                                               -idir data/benchmark/sql/td_data \
                                                               -runs 100 \
                                                                -w 50 \
                                                               -ucf /bsbm/scripts/bsbm_generator/sparql_ontop.txt \
                                                               -o results/benchmark_100millionen_singleServer.xml
