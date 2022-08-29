#!/usr/bin/bash

printf "\n$(date +%T) ==========[ Join to cluster ]==========\n"
$(cat /vagrant/join_token.txt) || :