#!binbash

PSQL=psql --username=freecodecamp --dbname=users -t --no-align -c

SECRET_NUMBER=$(($RANDOM%1001))

echo Enter your username
read USERNAME

if [[ -z $USERNAME ]]
then
  echo Please input a string!
else
  SEARCH_USERNAME=$($PSQL select  from users where name = '$USERNAME';)
  
  if [[ -z $SEARCH_USERNAME ]]
  then
    echo Welcome, $USERNAME! It looks like this is your first time here.
  else
    USER_DATA=$($PSQL select COUNT(game_id), MIN(tries) from users join games using(game_id) where name = '$USERNAME';)
    echo $USER_DATA  while IFS= read GAMES_PLAYED BEST_GAME
    do
      echo Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses.
    done
  fi

  echo Guess the secret number between 1 and 1000
  read NUMBER
  TRIES=1
  while [[ ! $NUMBER == $SECRET_NUMBER ]]
  do
    if [[ ! $NUMBER =~ ^[0-9]+$ ]]
    then
      echo That is not an integer, guess again
      read NUMBER
    elif [[ $NUMBER -gt $SECRET_NUMBER ]]
    then
      echo It's lower than that, guess again
      read NUMBER
      ((TRIES=TRIES+1))
    elif [[ $NUMBER -lt $SECRET_NUMBER ]]
    then
      echo It's higher than that, guess again
      read NUMBER
      ((TRIES=TRIES+1))
    fi

    if [[ $NUMBER -eq $SECRET_NUMBER ]]
    then
      echo You guessed it in $TRIES tries. The secret number was $SECRET_NUMBER. Nice job!
    fi
  done
  
  INSERT_GAME=$($PSQL insert into games(tries) values($TRIES);)
  GET_LAST_GAME=$($PSQL SELECT MAX(game_id) from games;)
  INSERT_USER=$($PSQL insert into users(name, game_id) values('$USERNAME', $GET_LAST_GAME);)
fi