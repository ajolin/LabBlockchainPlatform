#!/bin/bash

echo "Creating Admin Card"
echo "composer card create -f adminCard.card -p ./marble-project/connection-profile.json -u admin -c ./marble-project/credentials/admin-pub.pem -k ./marble-project/credentials/admin-priv.pem --role PeerAdmin --role ChannelAdmin"
composer card create -f adminCard.card -p ./marble-project/connection-profile.json -u admin -c ./marble-project/credentials/admin-pub.pem -k ./marble-project/credentials/admin-priv.pem --role PeerAdmin --role ChannelAdmin
echo "Importing card to local composer"
echo "composer card import -f adminCard.card -c adminCard"
composer card import -f adminCard.card -c adminCard
echo "composer card list"
composer card list