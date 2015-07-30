#!/bin/bash
MYSQL=`which mysql`

echo "Enter user_name :"
read username
echo "Enter password :"
read user_password
echo "Enter database_name Which you want to create:"
read user_database

P1="CREATE DATABASE IF NOT EXISTS $user_database;"
P2="CREATE USER '$username'@'localhost' IDENTIFIED BY '$user_password';"
P3="GRANT ALL PRIVILEGES ON $user_database.* TO '$username'@'localhost' WITH GRANT OPTION;"
P4="FLUSH PRIVILEGES;"
SQL="${P1}${P2}${P3}${P4}"

read -p "Create user::$username, password::$user_password, database::$user_database Please Confirm (y/n) : " confirm

if [ "$confirm" == 'y' ]; then
$MYSQL -uroot -p -e "$SQL"
else
read -p "Press any key to continue.."
fi
