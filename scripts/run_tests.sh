#!/bin/bash

# Initialize the opam environment
opam init -y --disable-sandboxing
eval $(opam env)

# Install dune and ounit2
opam install dune ounit2 -y

echo "Ocamleers environment initialized!" 
