#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

# Function to generate a random number between 1 and 1000
generate_random_number() {
  echo "$((RANDOM % 1000 + 1))"
}

# Main function
main() {
  echo "Enter your username:"
  read username
  # Check if username exists in the database
  user_exists=$($PSQL "SELECT * FROM users WHERE username = '$username'" )
  if [[ -z $user_exists ]]; then
    # Insert new user into the database
    new_user=$($PSQL "INSERT INTO users (username, games_played, best_game) VALUES ('$username', 0, NULL)")
    echo "Welcome, $username! It looks like this is your first time here."
  else
    # Fetch and display user's information
    games_played=$($PSQL "SELECT games_played FROM users WHERE username='$username'")
    best_game=$($PSQL "SELECT best_game FROM users WHERE username='$username'")
    echo "Welcome back, $username! You have played $games_played games, and your best game took $best_game guesses."
  fi
  run_game
    
}
run_game() {
  # Function to run the number guessing game
  secret_number=$(generate_random_number)
  guesses=0
  echo "Guess the secret number between 1 and 1000:"
  while true; do
    read guess
    # Check if input is an integer
    if ! [[ "$guess" =~ ^[0-9]+$ ]]; then
      echo "That is not an integer, guess again:"
      continue
    fi

    ((guesses++))

    if ((guess < secret_number)); then
      echo "It's higher than that, guess again:"
    elif ((guess > secret_number)); then
      echo "It's lower than that, guess again:"
    else
      echo "You guessed it in $guesses tries. The secret number was $secret_number. Nice job!"
      break
    fi
  done

  # Update user's information in the database
  games_played=$($PSQL "SELECT games_played FROM users WHERE username='$username'")
  best_game=$($PSQL "SELECT best_game FROM users WHERE username='$username'")

  if ((games_played == 0)) || ((guesses < best_game)); then
      best_game=$guesses
  fi

  ((games_played++))
  update_info=$($PSQL "UPDATE users SET games_played=$games_played, best_game=$best_game WHERE username='$username'")
}

main

