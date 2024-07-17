#!/bin/bash

# Set the exercises directory
EXERCISES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/../exercises"

# Function to initialize the environment
init_env() {
  echo "Initializing Ocamleers environment..."
  ./scripts/init.sh
}

# Function to run tests for all exercises
run_tests() {
  echo "Running all tests..."
  ./scripts/run_tests.sh
}

# Function to run tests for a specific exercise
run_exercise_tests() {
  local exercise=$1
  if [ -z "$exercise" ]; then
    echo "Usage: $0 test <exercise>"
    exit 1
  fi
  echo "Running tests for $exercise..."
  cd "$EXERCISES_DIR/$exercise" || { echo "Exercise $exercise not found"; exit 1; }
  dune runtest
}

# Main command handling
case "$1" in
  init)
    init_env
    ;;
  test)
    if [ -n "$2" ]; then
      run_exercise_tests "$2"
    else
      run_tests
    fi
    ;;
  *)
    echo "Usage: $0 {init|test [exercise]}"
    exit 1
    ;;
esac
