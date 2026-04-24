#!/bin/bash
RAND_INT=$((RANDOM % 1000 + 1))

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

echo "Enter your username:"
read USERNAME
if [[ ! $USERNAME =~ ^[A-Za-z0-9_]{0,22}$ ]]; then
  echo "Please enter a valid username."
  exit 1
fi

USER_ID=$($PSQL "SELECT player_id FROM record_of_players WHERE username = '$USERNAME'")

if [[ -z $USER_ID ]]; then
  echo "Welcome, $USERNAME! It looks like this is your first time here."
  $PSQL "INSERT INTO record_of_players(username) VALUES('$USERNAME')" > /dev/null
  USER_ID=$($PSQL "SELECT player_id FROM record_of_players WHERE username = '$USERNAME'")
else
  GAMES_PLAYED=$($PSQL "SELECT games_played FROM record_of_players WHERE player_id = $USER_ID")
  BEST_GAME=$($PSQL "SELECT best_game FROM record_of_players WHERE player_id = $USER_ID")
  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

echo "Guess the secret number between 1 and 1000:"


INT_GUESSED=0
NUM_OF_GUESSES=0

while [[ $INT_GUESSED -ne $RAND_INT ]]; do
    read -p "Your guess: " INT_GUESSED
    
    if ! [[ $INT_GUESSED =~ ^[0-9]+$ ]]; then
        echo "That is not an integer, guess again:"
        continue
    fi

    ((NUM_OF_GUESSES++))

    if [[ $INT_GUESSED -gt $RAND_INT ]]; then
        echo "It's lower than that, guess again:"
    elif [[ $INT_GUESSED -lt $RAND_INT ]]; then
        echo "It's higher than that, guess again:"
    fi
done

((GAMES_PLAYED++)) 2>/dev/null || GAMES_PLAYED=1
if [[ -z $BEST_GAME || $BEST_GAME -eq 0 ]]; then BEST_GAME=999999; fi

if [[ $NUM_OF_GUESSES -lt $BEST_GAME ]]; then
  BEST_GAME=$NUM_OF_GUESSES
fi

$PSQL "UPDATE record_of_players 
       SET games_played = $GAMES_PLAYED, 
           best_game = $BEST_GAME 
       WHERE player_id = $USER_ID" > /dev/null

echo "You guessed it in $NUM_OF_GUESSES tries. The secret number was $RAND_INT. Nice job!"
