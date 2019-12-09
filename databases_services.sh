# !/bin/bash
# Program to manage databases using docker
# Author Cristhian Forero

date=`date +%Y%m%d`

read -s -p "Type super user password:" pass_su

mysql_service () {

    clear
    echo "--------------------------"
    echo "         MYSQL            "
    echo "--------------------------"
    echo "         MENU             "
    echo "--------------------------"
    echo "1. Star MYSQL service"
    echo "2. Stop MYSQL service"
    echo "3. View logs"
    echo "4. Access the MYSQL console"
    echo "5. Generate backup"
    echo "6. Remove service"
    echo "7. Edit docker-compose file"

    echo -e "\n"
    read -n1 -p "Insert a option: " option1

    case $option1 in
        1)
            echo -e "\n"
            cd ~/docker-services/mysql && docker-compose up -d
            read -n1 -s -r -p "Press [ENTER] to continue..."
            ;;
        2)
            echo -e "\n"
            cd ~/docker-services/mysql && docker-compose stop
            read -n1 -s -r -p "Press [ENTER] to continue..."
            ;;
        3)
            echo -e "\nTo exit the logs press CTRL + C, you must run the program again"
            sleep 3
            cd ~/docker-services/mysql && docker-compose logs -f
            ;;
        4)
            echo -e "\nmysql password will be requested"
            docker exec -it mysql_DB mysql -p
            ;;
        5)
            echo -e "\nGenerate backup"

            if [ -d "~/dumps" ]; then
                echo -e "\nDirectory already exists!!"
                echo "$pass_su" | sudo -S chmod 777 ~/dumps
            else
                echo "$pass_su" | sudo -S mkdir ~/dumps
                echo "$pass_su" | sudo -S chmod 777 ~/dumps
            fi

            read -s -p "Type the password of mysql:" password
            echo -e "\n--------------------------------------"
            echo -e "\nList Databases:"
            echo -e "\n--------------------------------------"
            docker exec mysql_DB echo "show databases;" | mysql -u root --password=$password --host=127.0.0.1 --port=3306
            echo -e "\n--------------------------------------"
            read -p "Type the database name:" database
            random=$(($RANDOM))
            docker exec mysql_DB /usr/bin/mysqldump -u root --password=$password $database > ~/dumps/mysql-$database-$random-backup-$date.sql
            zip ~/dumps/mysql-$database-$random-backup-$date.zip ~/dumps/*.sql
            echo "$pass_su" | sudo rm -r ~/dumps/mysql-$database-$random-backup-$date.sql
            echo -e "\nBackup generate in: /dumps/mysql-$database-$random-backup-$date.sql"
            read -n1 -s -r -p "Press [ENTER] to continue..."
            ;;
        6)
            echo -e "\n"
            cd ~/docker-services/mysql && docker-compose down -v
            echo -e "\n"
            read -n1 -s -r -p "Press [ENTER] to continue..."
            ;;
        7)
            cd ~/docker-services/mysql && vim docker-compose.yaml
            echo -e "\n"
            read -n1 -s -r -p "Press [ENTER] to continue..."
            ;;
        *)
            echo -e "\nTry Again..."
            sleep 1
            ;;
    esac
}

mongo_service () {
    clear
    echo "--------------------------"
    echo "         MONGO DB         "
    echo "--------------------------"
    echo "         MENU             "
    echo "--------------------------"
    echo "1. Star Mongo DB service"
    echo "2. Stop Mongo DB service"
    echo "3. View logs"    
    echo "4. Remove service"
    echo "5. Edit docker-compose file"

    echo -e "\n"
    read -n1 -p "Insert a option: " option2

    case $option2 in
        1)
            echo -e "\n"
            cd ~/docker-services/mongo-db && docker-compose up -d
            read -n1 -s -r -p "Press [ENTER] to continue..."
            ;;
        2)
            echo -e "\n"
            cd ~/docker-services/mongo-db && docker-compose stop
            read -n1 -s -r -p "Press [ENTER] to continue..."
            ;;
        3)
            echo -e "\nTo exit the logs press CTRL + C, you must run the program again"
            sleep 3
            cd ~/docker-services/mongo-db && docker-compose logs -f
            ;;        
        4)
            echo -e "\n"
            cd ~/docker-services/mongo-db && docker-compose down -v
            echo -e "\n"
            read -n1 -s -r -p "Press [ENTER] to continue..."
            ;;
        6)
            cd ~/docker-services/mongo-db && vim docker-compose.yaml
            echo -e "\n"
            ;;
        *)
            echo -e "\nTry Again..."
            sleep 1
            ;;
    esac
}

oracle_service () {
    clear
    echo "--------------------------"
    echo "         ORACLE           "
    echo "--------------------------"
    echo "         MENU             "
    echo "--------------------------"
    echo "1. Star ORACLE service"
    echo "2. Stop ORACLE service"
    echo "3. View logs"
    echo "4. Remove service"
    echo "5. Edit docker-compose file"

    echo -e "\n"
    read -n1 -p "Insert a option: " option3

    case $option3 in
        1)
            echo -e "\n"
            cd ~/docker-services/oracle && docker-compose up -d
            read -n1 -s -r -p "Press [ENTER] to continue..."
            ;;
        2)
            echo -e "\n"
            cd ~/docker-services/oracle && docker-compose stop
            read -n1 -s -r -p "Press [ENTER] to continue..."
            ;;
        3)
            echo -e "\nTo exit the logs press CTRL + C, you must run the program again"
            sleep 3
            cd ~/docker-services/oracle && docker-compose logs -f
            ;;
        4)
            echo -e "\n"
            cd ~/docker-services/oracle && docker-compose down -v
            echo -e "\n"
            read -n1 -s -r -p "Press [ENTER] to continue..."
            ;;
        5)
            cd ~/docker-services/oracle && vim docker-compose.yaml
            echo -e "\n"
            ;;
        *)
            echo -e "\nTry Again..."
            sleep 1
            ;;
    esac
}

postgres_service () {
    clear
    echo "--------------------------"
    echo "         PostgreSQL       "
    echo "--------------------------"
    echo "         MENU             "
    echo "--------------------------"
    echo "1. Star PostgreSQL service"
    echo "2. Stop PostgreSQL service"
    echo "3. View logs"
    echo "4. Remove service"
    echo "5. Edit docker-compose file"
    echo "6. Open pgAdmin"

    echo -e "\n"
    read -n1 -p "Insert a option: " option4

    case $option4 in
        1)
            echo -e "\n"
            cd ~/docker-services/postgresql && docker-compose up -d
            read -n1 -s -r -p "Press [ENTER] to continue..."
            ;;
        2)
            echo -e "\n"
            cd ~/docker-services/postgresql && docker-compose stop
            read -n1 -s -r -p "Press [ENTER] to continue..."
            ;;
        3)
            echo -e "\nTo exit the logs press CTRL + C, you must run the program again"
            sleep 3
            cd ~/docker-services/postgresql && docker-compose logs -f
            ;;
        4)
            echo -e "\n"
            cd ~/docker-services/postgresql && docker-compose down -v
            echo -e "\n"
            read -n1 -s -r -p "Press [ENTER] to continue..."
            ;;
        5)
            cd ~/docker-services/postgresql && vim docker-compose.yaml
            echo -e "\n"
            ;;
        6)
            xdg-open 'http://localhost:16543'
            ;;
        *)
            echo -e "\nTry Again..."
            sleep 1
            ;;
    esac
}

sqlserver_service () {
    clear
    echo "--------------------------"
    echo "         SQLServer        "
    echo "--------------------------"
    echo "         MENU             "
    echo "--------------------------"
    echo "1. Star SQLServer  service"
    echo "2. Stop SQLServer  service"
    echo "3. View logs"
    echo "4. Remove service"
    echo "5. Edit docker-compose file"

    echo -e "\n"
    read -n1 -p "Insert a option: " option5

    case $option5 in
        1)
            echo -e "\n"
            cd ~/docker-services/sql-server && docker-compose up -d
            read -n1 -s -r -p "Press [ENTER] to continue..."
            ;;
        2)
            echo -e "\n"
            cd ~/docker-services/sql-server && docker-compose stop
            read -n1 -s -r -p "Press [ENTER] to continue..."
            ;;
        3)
            echo -e "\nTo exit the logs press CTRL + C, you must run the program again"
            sleep 3
            cd ~/docker-services/sql-server && docker-compose logs -f
            ;;
        4)
            echo -e "\n"
            cd ~/docker-services/sql-server && docker-compose down -v
            echo -e "\n"
            read -n1 -s -r -p "Press [ENTER] to continue..."
            ;;
        5)
            cd ~/docker-services/sql-server && vim docker-compose.yaml
            echo -e "\n"
            ;;
        *)
            echo -e "\nTry Again..."
            sleep 1
            ;;
    esac
}

sqlite_service () {
    clear
    echo "--------------------------"
    echo "         SQLite           "
    echo "--------------------------"
    echo "         MENU             "
    echo "--------------------------"
    echo "1. Install SQLite"
    echo "2. Uninstall SQLite "

    echo -e "\n"
    read -n1 -p "Insert a option: " option6

    case $option6 in
        1)
            echo -e "\n"
            echo "$pass_su" | sudo -S apt-get update
            echo "$pass_su" | sudo -S apt-get install -y sqlite3
            version=$(sqlite3 --version)
            echo -e "\nVersion: $version"
            read -n1 -s -r -p "Press [ENTER] to continue..."
            ;;
        2)
            echo -e "\n"
            echo "$pass_su" | sudo -S apt-get -y --purge remove sqlite3
            read -n1 -s -r -p "Press [ENTER] to continue..."
            ;;
        *)
            echo -e "\nTry Again..."
            sleep 1
            ;;
    esac

}

#Main Program

while :
do
    #Clean terminal
    clear
    # Options menu
    echo "--------------------------"
    echo "DATABASE SERVICES - DOCKER"
    echo "--------------------------"
    echo "          MENU            "
    echo "--------------------------"
    echo "1. MYSQL"
    echo "2. Mongo DB"
    echo "3. ORACLE"
    echo "4. PostgreSQL"
    echo "5. SQLServer"
    echo "6. SQLite"
    echo "7. Exit"

    #Read selected option
    echo -e "\n"
    read -n1 -p "Insert a option:" option

    #Validate option
    case $option in
        1)
            mysql_service
            sleep 3
            ;;
        2)
            mongo_service
            sleep 3
            ;;
        3)
            oracle_service
            sleep 3
            ;;
        4)
            postgres_service
            sleep 3
            ;;
        5)
            sqlserver_service
            sleep 3
            ;;
        6)
            sqlite_service
            sleep 3
            ;;
        7)
            echo -e "\nExit..."
            sleep 1
            clear
            exit 0
            ;;
        *)
            echo -e "\nTry again"
            sleep 1
            ;;
   esac
done
