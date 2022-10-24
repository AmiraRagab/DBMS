#!/usr/bin/bash


if [ ! -d "database" ]
then
    mkdir database
fi
echo -e "================================================================="

echo -e "       ***Welcome In Our DataBase Engine ***\n"

echo -e "================================================================="
select choice in "Create database" "List database" "Connect to database" "Drop database" "Exit"
do
    case $REPLY in
      1) source ./Create.sh  ;;
      2) source ./ListDB.sh ;;
      3) source ./ConnectDB.sh ;;
      4) source ./DropDb.sh ;;
      5) break ;;
      *) echo -e "Invalid option"
            source ./Main_menu.sh;;

esac

done
