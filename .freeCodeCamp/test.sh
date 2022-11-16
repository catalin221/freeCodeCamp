#!/bin/bash
#Program to tell a persons fortune

echo -e "\n~~ Fortune Teller ~~\n"
N=$((RANDOM%1))
RESPONSES=("Yes" "No" "Maybe" "Outlook good" "Don't count on it" "Ask again later") 
echo ${RESPONSES[$N]}