#!/bin/bash

# Ensure the OCaml environment is set
eval $(opam env)

# Run dune tests
echo "Running all tests..."
dune runtest
