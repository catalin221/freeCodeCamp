#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

echo $($PSQL "truncate table teams, games")
cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  if [[ $YEAR != year ]]
  then
    #get winner and opponent ids
    WINNER_ID=$($PSQL "select team_id from teams where name = '$WINNER';")
    OPPONENT_ID=$($PSQL "select team_id from teams where name = '$OPPONENT';")

    #if winner not found
    if [[ -z $WINNER_ID ]]
    then
      #insert winner
      $PSQL "insert into teams(name) values('$WINNER')";

      #get new winner_id
      WINNER_ID=$($PSQL "select team_id from teams where name = '$WINNER';")
    fi

    #if opponent not found
    if [[ -z $OPPONENT_ID ]]
    then
      #insert team
      $PSQL "insert into teams(name) values('$OPPONENT')";

      #get new winner_id
      OPPONENT_ID=$($PSQL "select team_id from teams where name = '$OPPONENT';")
    fi

    #get game_id
    GAME_ID=$($PSQL "select game_id from games where year = $YEAR and round = '$ROUND' and winner_goals = $WINNER_GOALS and opponent_goals = $OPPONENT_GOALS
    and winner_id = $WINNER_ID and opponent_id = $OPPONENT_ID ;")

    #if game not found
    if [[ -z $GAME_ID ]] 
    then 
      #insert game
      $PSQL "insert into games(year, round, winner_goals, opponent_goals, winner_id, opponent_id) values($YEAR, '$ROUND', $WINNER_GOALS, $OPPONENT_GOALS, $WINNER_ID, $OPPONENT_ID);"
    fi
  fi
done