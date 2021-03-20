#!/bin/bash

trap '' 2  # ignore ctrl+c
cat header1
##set PS3 prompt##
PS3="Enter your selection: "

function fullinstall {
        df -h
}

function users {
        who
}

select opts in "fullinstall" "installwithoutqt" "exit script"
do
        case $opts in
                "fullinstall")
                                sudo apt update
                                echo -e "hello"
                                echo "o"
                                break
                                ;;
                "installwithoutqt")
                                echo -e "\e[0;32m $(users) \e[m"
                                ;;
                "exit script")
                                break
                                ;;
                *)
                                 echo "invalid option"
                                ;;
        esac
done
