#!/bin/bash

if [ $# -lt 1 ]; then 
    echo "need enrollSecret as parameter"
    exit
fi

ENROLLSECRET=$1

echo " Creating CA Card"
echo "composer card create -f ca.card -p ./marble-project/connection-profile.json -u admin -s $ENROLLSECRET"
composer card create -f ca.card -p ./marble-project/connection-profile.json -u admin -s $ENROLLSECRET
echo "Importing CA card to local composer"
echo "composer card import -f ca.card -c ca"
composer card import -f ca.card -c ca
echo "Retrieving credentials"
echo "composer identity request --card ca --path ./marble-project/credentials -u admin -s $ENROLLSECRET"
composer identity request --card ca --path ./marble-project/credentials -u admin -s $ENROLLSECRET
cat ./marble-project/credentials/admin-pub.pem
