#!/usr/bin/env bash
sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
sudo apt-get update
sudo apt-get -y install postgresql postgresql-client
sudo sed -i 's/^local.*all.*all.*peer$/local\tall\t\tall\t\t\t\t\tpassword/'  /etc/postgresql/[0-9]*/main/pg_hba.conf
sudo service postgresql restart
echo "CREATE USER { db_user } WITH SUPERUSER CREATEDB PASSWORD { db_user password };" | sudo -u postgres psql
#echo "CREATE DATABASE laravel;" | sudo -u postgres psql
#echo "GRANT ALL PRIVILEGES ON DATABASE laravel TO laravel;" | sudo -u postgres psql
