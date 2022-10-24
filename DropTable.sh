#!/usr/bin/bash
if [ `ls ./database/$dbname | wc -l` == 0 ]
then
      echo -e "================================================================="
      echo -e "No Table Found"
      echo -e "================================================================="
      source ./Connect-Menu.sh
fi      

echo -e "===============Drop Tables===============\n"

read -rp "Which Table do you want to drop?" tbname
while [[ ! -f ./database/$dbname/$tbname ]] || [[ -z $tbname ]]
  do
      echo -e "Invalid Input"
      read -rp "please enter valid Table name:" tbname
     
done
while [[ -f ./database/$dbname/$tbname ]]
do   
     read -rp "Are you sure? [y/N] " response
      case "$response" in
        [yY]) 
            rm ./database/$dbname/$tbname 
            rm ./database/$dbname/$tbname.Type
            echo -e "Table Deleted successfully"
            echo -e "================================================================="
            source ./Connect-Menu.sh
            ;;
          
        [Nn])
            echo -e "Table Not Deleted"
            echo -e "================================================================="
            source ./Connect-Menu.sh
          ;;
        *)  
            echo -e "Invalid Input"
            echo -e "================================================================="
            source ./DropTable.sh
            ;;
       esac 
done
