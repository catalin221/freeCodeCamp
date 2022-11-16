#!/bin/bash
#Program to tell a persons fortune

echo -e "\n~~ Fortune Teller ~~\n"
N=$((RANDOM%6))
RESPONSES=("Yes" "No" "Maybe" "Outlook good" "Don't count on it" "Ask again later") 
echo ${RESPONSES[$N]}

GET_FORTUNE() {

  if [[ ! $1 ]]
  then
    echo Ask a yes or no question:
    read QUESTION
  else
    echo Try again. Make sure it ends with a question mark:
  read QUESTION
  fi

  until [[ $QUESTION =~ \?$ ]]
  do
    GET_FORTUNE
  done
}

GET_FORTUNE
GET_FORTUNE again