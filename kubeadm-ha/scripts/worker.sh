#!/bin/bash

printf "\n$(date +%T) ==========[ Join cluster ]==========\n"

sh -c "$(cat /vagrant/join_token.txt)"
