#! /bin/bash

git pull origin master --rebase
echo 'pull is done -' $(date) >> /home/ak01/cronTlocal.log
