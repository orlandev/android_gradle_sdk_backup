#!/bin/bash

LOCK_FILE=/tmp/script.backup.lock

if [[ ! -e $LOCK_FILE ]]; then
      	touch $LOCK_FILE 
	if [ $1 == 'u' ]
	then
	   C_PATH=`pwd`
	   mkdir ~/test
	   cd ~/test
	   mkdir .konan
	   mkdir sdk
	   mkdir .gradle
   	   unzip -u "$C_PATH"/backup/gradle.zip -d ~/test/.gradle/
	   unzip -u "$C_PATH"/backup/konan.zip -d ~/test/.konan/
	   unzip -u "$C_PATH"/backup/sdk.zip -d ~/test/sdk/
	else
   	   #Compress gradle
           mkdir "backup"
   	   zip -r -1 ./backup/gradle.zip  ~/.gradle
   	   zip -r -1 ./backup/konan.zip  ~/.konan
   	   #Compress SDK
   	   zip -r -1 ./backup/sdk.zip $1
	fi      
	rm -f $LOCK_FILE
  else
     echo "Another copy of this script is running"
fi
