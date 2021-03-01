#!/bin/bash

echo "*** Creating scratch org ..."
sfdx force:org:create -f config/project-scratch-def.json --setdefaultusername --setalias CBPBrandingScratch -d 30

echo "*** Pushing metadata to scratch org ..."
sfdx force:source:push

read -n1 -s -r -p $'Press [SPACE] to continue...\n' key

echo "*** Generating password for your users ..."
sfdx force:user:password:generate --targetusername CBPBrandingScratch

echo "*** Creating data"
#sfdx sfdmu:run --sourceusername csvfile --targetusername CBPBrandingScratch -p data

echo "*** Setting up debug mode..."
sfdx force:apex:execute -f scripts/apex/setDebugMode.apex

echo "*** Opening Org"
#sfdx force:org:open
sfdx force:org:open -p /lightning/page/home
