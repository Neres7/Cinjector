#!/bin/bash
#Author : Vitor Neres
echo -e "\e[31m
   _____   _____       _           _             
  / ____| |_   _|     (_)         | |            
 | |        | |  _ __  _  ___  ___| |_ ___  _ __ 
 | |        | | | '_ \| |/ _ \/ __| __/ _ \| '__|
 | |____   _| |_| | | | |  __/ (__| || (_) | |   
  \_____| |_____|_| |_| |\___|\___|\__\___/|_|   
                     _/ |                        
                    |__/                         \e[0m"

usage() {
  echo "Usage: $0 -u URL [-w wordlist] [-c command]"
  echo ""
  echo "Options:"
  echo "  -u  Target URL."
  echo "  -w  Path to the wordlist file. Uses default [payloads.txt] if not especified"
  echo "  -c  Command to execute after each payload is tested."
  echo "  -h  Display this help message."
  exit 1
}

while getopts "u:w:c:h" opt; do
  case $opt in
    u)
      url=$OPTARG
      ;;
    w)
      wordlist=$OPTARG
      ;;
    c)
      command=$OPTARG
      ;;
    h)
      usage
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      usage
      ;;
    :)
      echo "Option -$OPTARG requires an argument." >&2
      usage
      ;;
  esac
done

if [ -z "$url" ]; then
  echo "The -u option is mandatory." >&2
  usage
fi

if echo "$url" | grep -q "^https"; then
  curl_cmd="curl -k"
else
  curl_cmd="curl"
fi

if [ -z "$wordlist" ]; then
  wordlist="payloads.txt"
fi

if [ ! -f "$wordlist" ]; then
  echo "Wordlist not found: $wordlist" >&2
  exit 1
fi

command_index=0
while read -r payload; do
  ((command_index++))
  if echo "$url" | grep -q "^https"; then
    $curl_cmd "${url}${payload}" -s -o /dev/null -w "%{http_code}\n" 2>&1 | grep -q "200"
  else
    $curl_cmd -s -o /dev/null -w "%{http_code}\n" "${url}${payload}" | grep -q "200"
  fi
  if [ $? -eq 0 ]; then
    sleep 1s
    echo "URL found: ${url}${payload}"
    echo -e "Successful payload: \033[1;31m${payload}\033[0m"
                echo -e "\e[32m[+] Payload worked: $payload\e[0m"
    if [ -n "$command" ]; then
      eval "$command"
    fi
  fi
done < "$wordlist"
