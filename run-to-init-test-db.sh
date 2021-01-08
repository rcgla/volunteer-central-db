echo "Loading .env"
source .env

cd initial-schema

echo "Clearing database and setting up schema"
psql --set=appRolePassword="$APP_ROLE_PASSWORD" --set=dbname="$DBNAME" < run-to-resetdb.pgsql

# wait

# cd ../

# cd gen-test-data
# #npm run start
# wait

# cd ../
# #cp gen-test-data/out testdata.pgsql
# wait
# #psql --set=dbname="$DBNAME" < testdata.pgsql
