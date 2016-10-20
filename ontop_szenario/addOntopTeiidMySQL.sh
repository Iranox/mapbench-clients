git submodule add  -b feature/teiid --force https://github.com/Iranox/mapbench-data.git data
cat  docker-compose.yml scripts/addTeiidMysql.txt >> docker-compose.yml
cat  docker-compose.yml scripts/add.txt >> docker-compose.yml

