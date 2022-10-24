#!/usr/bin/bash
echo -e "=====================Create Database==================="
read -p  "Enter Database Name: " name
try=3

while [[ -z $name ]] || [[ $name == *['!''@#/$\"*{^})(+|,;:~`._%&/=-]>[<?']* ]] || [[ $name =~ [0-9] ]] || [[ "$name == [:space:]" ]] 
do
            echo  "Invalid Input"
	    echo  " You have $try left to follow the instraction  "
            read -rpe "PLease Enter Database Name Again:" name
	     try=`expr $try - 1` 

	     if [ $try == 0 ]
	     then 	     
        	 source ./Main_menu.sh
	     fi
done

if [ -d ./database/$name ]
then
    echo  "database already exists"
    echo  "================================================================="
    source ./Create.sh
fi
mkdir ./database/$name
echo  "Congratulations Your Database Is Created"
echo  "================================================================="
source ./Main_menu.sh
