#!/usr/bin/bash

echo -e "===============Create Table===============\n"

declare -a cnamearray 
declare -a ctypearray 
re='^[0-9]+$'

read -p "Enter Table name" tbname
while [[ -z $tbname ]] || [[ $tbname == *['!''@#/$\"*{^})(+_/|,;:~`.%&.=-]>[<?']* ]] || [[ $tbname =~ [0-9] ]]
do 
    echo -e "Invalid Input"
    read -p "PLease Enter Table Name Again:" tbname
done

while [ -f ./database/$dbname/$tbname ] 
do
    echo -e "Table Already Exists"
    source ./CreateTable.sh
done
#read column number from user
read -p "Enter Number Of Columns: " cnumber
# function to check validation of cnumber
function valcnumber()
{
  if ! [[ $cnumber =~ $re ]]
  then
    echo -e "Invalid Input It Must Be A Number"
    echo -e "================================================================="
    source ./Connect-Menu.sh
  fi   
}
valcnumber                    #calling function
export cnumber

echo -e "*****First Column Must Be Primary Key*****"
touch ./database/$dbname/$tbname ./database/$dbname/$tbname.Type 
# to enter the columns name with input column numbers
for (( i=0 ; i < $cnumber ; i++ ))
do
  read -p "Enter Name of column $((i+1)): " cname
  while [[ -z $cname ]] || [[ $cname == *['!''@#/$\"*{^})(+_/|,;:~`.%&=-]>[<?']* ]] || [[ $cname =~ $re ]]
  do 
    echo -e "Invalid Input"
    read -p "PLease Enter column Name Again:" cname
  done
 
  ##### check if the cname is exists or not 
  while [[ "${cnamearray[*]}" =~ "$cname" ]]
  do
    echo -e "This name is already exists"
    read -p "PLease Enter column Name Again:" cname
  done
   #enter datatype     
  read -p "Enter DataType of column $((i+1)): [string/int] " ctype  
  #check on datatype
  while [[ $ctype != int ]] && [[ $ctype != string ]] 
  do
    echo -e "Invalid DataType"   
    read -p "Enter DataType of column $((i+1)): [string/int] " ctype
  done
        
        cnamearray[$i]=$cname
        ctypearray[$i]=$ctype

done
#put delimeter
for (( i=0 ; i < $cnumber ; i++ ))
do
  echo -ne "${cnamearray[$i]}:" >> ./database/$dbname/$tbname
done
echo "" >> ./database/$dbname/$tbname

##Append data to table and tabletype
echo ${ctypearray[@]} >> ./database/$dbname/$tbname.Type

echo -e "Congratulations Your Table Is Created"
echo -e "================================================================="
source ./Connect-Menu.sh
