#!/bin/bash

echo '========== Join cluster'

sh -c "$(cat /vagrant/join_token.txt)"
