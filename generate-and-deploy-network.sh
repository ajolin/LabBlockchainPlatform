#!/bin/bash

cd marble-network
echo "Generating the network"
composer archive create -t dir -n .
echo "Instaling the network on the Blockchain platform"
composer network install -a marbles-network@0.1.1-deploy.0.bna -c adminCard
echo "Starting the network"
composer network start -c adminCard -n marbles-network -V 0.1.1-deploy.0 -A admin -C ../marble-project/credentials/admin-pub.pem -f delete_me.card
