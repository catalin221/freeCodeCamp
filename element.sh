#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table --no-align --tuples-only -c"

if [[ -z $1 ]]
then
  echo "Please provide an element as an argument."
else
  if [[ $1 =~ ^[0-9]+$ ]]
  then
    ELEMENT_FOUND=$($PSQL "select atomic_number, atomic_mass, melting_point_celsius, boiling_point_celsius, symbol, name, type from properties join elements using(atomic_number) join types using(type_id) where elements.atomic_number = $1")
    echo $ELEMENT_FOUND
  fi

  if [[ -z $ELEMENT_FOUND ]]
  then
    echo "I could not find that element in the database"
  fi
fi