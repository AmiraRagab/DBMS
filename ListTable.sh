#!/usr/bin/bash

echo -e "===============List Tables===============\n"
if [ `ls ./database/$dbname/ | wc -l` == 0 ]
then     
    echo -e "No Table Found"
    echo -e "=================================================================" 
    source ./Connect-Menu.sh   
else
    ls ./database/$dbname
    echo -e "================================================================="
    source ./Connect-Menu.sh
fi
