#!/bin/bash

   BUILD_LOG="$HOME/ms_build.log"
   MSDIR="$HOME/repos/moysklad/moysklad-all"
   CUR_DIR=`pwd`
   if [[ ! -f $BUILD_LOG ]]; then
       touch $BUILD_LOG
   fi
   cd $MSDIR
   bash -c "$MSDIR/stop-jboss.sh"
   case $1 in
       gwt)
           bash -c "$MSDIR/ff-dev-full-rebuild.sh" |& tee $BUILD_LOG
           ;;
       *)
           bash -c "$MSDIR/skip-gwt-dev-build.sh" |& tee $BUILD_LOG
   esac
   BUILD_STATUS=$(cat $BUILD_LOG | grep -c "BUILD FAILURE")
   if [[ "$BUILD_STATUS" == "0" ]]; then
       bash -c "$MSDIR/clean-and-deploy-jboss.sh"
       bash -c "$MSDIR/start-jboss.sh"
   else
       echo "${red}Problem with build. Show log file - $BUILD_LOG${normal}"
   fi
   cd "$CUR_DIR"
   until $(curl --output /dev/null --silent --head --fail http://localhost:8080);
   do
      sleep 5
   done
   printf 'MC started!\n'
