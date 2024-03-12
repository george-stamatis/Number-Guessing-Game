# Number Guessing Game

This project is part of the freeCodeCamp curriculum for the "Relational Database" certification. It involves creating a Bash script for a number guessing game, where users have to guess a randomly generated number between 1 and 1000. The script interacts with a PostgreSQL database named "number_guess" to store and retrieve user information and game statistics.

# Project Description

The Number Guessing Game project aims to provide users with an entertaining and interactive game experience while also storing and tracking user statistics using a PostgreSQL database. By allowing users to input their username and guess the secret number, the script fosters user engagement and competition while maintaining a record of gameplay data.

# Key Features

- Random Number Generation: The script generates a random number between 1 and 1000 for users to guess.

- User Interaction: Users are prompted to enter their username before guessing the secret number. If the username has been used before, the script welcomes the user back and displays their game history. Otherwise, it welcomes the user as a new player.

  Gameplay: After entering the username, users input their guesses until they correctly guess the secret number. The script provides feedback on whether the guess is too high or too low and prompts the user to guess again.

- Error Handling: The script validates user input to ensure it is an integer. If the input is not an integer, the script prompts the user to guess again.

- Database Integration: The script interacts with a PostgreSQL database to store user information, including usernames, total games played, and best game performance.
