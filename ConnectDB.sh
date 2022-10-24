#!/usr/bin/bash
if [ `ls ./database/ | wc -l` == 0 ]
then
      echo -e "No Database Found"
      echo -e "================================================================="
      source ./Main_menu.sh
fi

echo -e "===============Connect Database===============\n"
read -p "Please Enter Database You Want To Connect: " dbname
export dbname
if [[ ! -d ./database/$dbname ]] || [[ -z $dbname ]]
then
      echo -e "$dbname  Database Not Found  Create new one "
      echo -e "================================================================="
      source ./Main_menu.sh
else
      echo -e "                $dbname Database Exists                 "
      echo -e "================================================================="
      source ./Connect-Menu.sh
fi
