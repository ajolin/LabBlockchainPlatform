#!/bin/bash

echo "Creating Business network card for operator"
composer card create -n marbles-network -p ./marble-project/connection-profile.json -u admin -c ./marble-project/credentials/admin-pub.pem -k ./marble-project/credentials/admin-priv.pem
echo "Importing the card"
composer card import --file admin@marbles-network.card
echo "Check if Business network is running"
composer network ping -c admin@marbles-network