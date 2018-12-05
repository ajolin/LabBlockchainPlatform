#!/bin/bash

echo "Creating Admin Card"
composer card create -f adminCard.card -p ./marble-project/connection-profile.json -u admin -c ./marble-project/credentials/admin-pub.pem -k ./marble-project/credentials/admin-priv.pem --role PeerAdmin --role ChannelAdmin
echo "Importing card to local composer"
composer card import -f adminCard.card -c adminCard
composer card list