#!/bin/bash

echo "Creating Business network card for operator"
echo "composer card create -n marbles-network -p ./marble-project/connection-profile.json -u admin -c ./marble-project/credentials/admin-pub.pem -k ./marble-project/credentials/admin-priv.pem"
composer card create -n marbles-network -p ./marble-project/connection-profile.json -u admin -c ./marble-project/credentials/admin-pub.pem -k ./marble-project/credentials/admin-priv.pem
echo "Importing the card"
echo "composer card import --file admin@marbles-network.card"
composer card import --file admin@marbles-network.card
echo "Check if Business network is running"
echo "composer network ping -c admin@marbles-network"
composer network ping -c admin@marbles-network