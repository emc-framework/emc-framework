#!/bin/bash

if [ -d emc ] 
then 
    cd emc
    git pull origin master
else
    git clone https://gitlab.com/EMC-Framework/EMC emc
    cd emc
fi

sudo chmod +x gradlew
./gradlew generateApiDocumentation
cd ..
rm -R public/*
cp -R emc/docs/* public/
git add public/*
git commit -m "Update docs"
git push origin master
