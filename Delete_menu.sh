#!/usr/bin/bash

if [ `ls ./database/$dbname | wc -l` == 0 ]
then
      echo -e "================================================================="
      echo -e "No Table Found"
      echo -e "================================================================="
      source ./Connect-Menu.sh
fi      

echo -e "===============Delete From Table===============\n"

read -rp "Enter Table You Want To Delete from : " tablename
export tablename
while [[ -z $tablename ]] || [[ $tablebname == *['!''@#/$\"*{^})(+_/=-]>[<?']* ]]
do 
  echo -e "Invalid Input"
  read -rp "PLease Enter Table Name Again:" tablename
done

if [ -f ./database/$dbname/$tablename ]
then

    select choice in "Delete All Records" "Delete Record" "Back To Menu"
    do
        case $REPLY in
        1) source ./DeleteAllRecord.sh ;;
        2) source ./DeleteRecord.sh ;;
        3) source ./Connect-Menu.sh ;;
        *) echo -e "invalid option" ;; 

        esac

    done
else
    echo -e "Table Name Not Exists"
    echo -e "================================================================="
    source ./Delete_menu.sh
fi	

