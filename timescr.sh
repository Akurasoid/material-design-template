#! /bin/bash

git pull origin master --rebase
echo 'pull is done - ' $(date) >> /home/ak/mdt-task/Lorem.log
