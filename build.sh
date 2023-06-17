#!/bin/bash

if [ -z "$2" ]; then
  DIR_NAME="app"
  P4_PROGRAM="p4/p4_only.p4"
else
  DIR_NAME="$1"
  P4_PROGRAM="$2"
fi

mkdir $DIR_NAME 

cd $DIR_NAME

git clone https://github.com/esnet/esnet-smartnic-hw.git

cd esnet-smartnic-hw

git submodule update --init --recursive

cd ../

cp esnet-smartnic-hw/examples/p4_only/Makefile ./

cp -r esnet-smartnic-hw/examples/p4_only/p4 ./

sed -i 's/\.\.\/\.\./$(CURDIR)\/esnet-smartnic-hw/g' Makefile 
sed -i 's/#export APP_NAME/export APP_NAME/g' Makefile
sed -i 's/#export P4_FILE/export P4_FILE/g' Makefile
sed -i 's/#export BUILD_NAME/export BUILD_NAME/g' Makefile

cp ../$P4_PROGRAM p4/`basename $PWD`.p4

if [ "$P4_PROGRAM_NAME" != "p4/p4_only.p4" ]; then
  rm -rf p4/p4_only.p4
fi
