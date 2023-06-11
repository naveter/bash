#!/bin/bash
MOYSKLAD_ALL=$HOME/repos/moysklad/moysklad-all

cd $HOME/repos/moysklad/moysklad-all

echo stop jboss
source $MOYSKLAD_ALL/stop-jboss.sh
sleep 1

echo clean and deploy jboss
source $MOYSKLAD_ALL/clean-and-deploy-jboss.sh 
sleep 1

echo start jboss
source $MOYSKLAD_ALL/start-jboss.sh

