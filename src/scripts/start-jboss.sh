#!/bin/bash
JBOSS_HOME=$HOME/wildfly-10.1.0.Final

echo starting recalc
nohup $JBOSS_HOME/bin/standalone-recalc.sh > /dev/null 2>&1 &
echo recalc started
sleep 3

echo starting webhook
#nohup $JBOSS_HOME/bin/standalone-webhook.sh > /dev/null 2>&1 &
echo webhook started
sleep 3

echo starting billing
#nohup $JBOSS_HOME/bin/standalone-billing.sh > /dev/null 2>&1 &
echo billing started
sleep 5

echo starting main
nohup $JBOSS_HOME/bin/standalone-main.sh > /dev/null 2>&1 &
echo main started

#echo starting main2
#nohup $JBOSS_HOME/bin/standalone-main-2.sh > /dev/null 2>&1 &
#echo main2 started

echo starting batch
nohup $JBOSS_HOME/bin/standalone-batch.sh > /dev/null 2>&1 &
echo batch started

echo starting exchange
#nohup $JBOSS_HOME/bin/standalone-exchange.sh > /dev/null 2>&1 &
echo exchange started

#sleep 15
#
#echo starting print
#nohup $JBOSS_HOME/bin/standalone-print.sh > /dev/null 2>&1 &
#echo print started

echo starting chatter
#nohup chatter-home/chatter.sh > /dev/null 2>&1 &
echo chatter started

