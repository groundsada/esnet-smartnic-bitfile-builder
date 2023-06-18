#!/bin/bash
#
# Script Name: ESnet-smartnic-bitfile-builder
# Author: Mohammad Firas Sada
# Email: mhd.firas.sada@gmail.com
# Date: June 16, 2023
# Description: This script automates compiling the P4 artifacts for esnet-smartnic-hw.

if [ "$#" -ne 2 ]; then
  echo "Usage: $0 <directory_name> <p4_program>"
  exit 1
fi

DIR_NAME="$1"
P4_PROGRAM="$2"

if [ ! -f "$P4_PROGRAM" ]; then
  echo "P4 program '$P4_PROGRAM' does not exist."
  exit 1
fi

mkdir "$DIR_NAME" || {
  echo "Failed to create directory $DIR_NAME"
  exit 1
}

cd "$DIR_NAME" || {
  echo "Failed to change directory to $DIR_NAME"
  exit 1
}

git clone https://github.com/esnet/esnet-smartnic-hw.git || {
  echo "Failed to clone the repository"
  exit 1
}

cd esnet-smartnic-hw || {
  echo "Failed to change directory to esnet-smartnic-hw"
  exit 1
}

git submodule update --init --recursive || {
  echo "Failed to update submodules"
  exit 1
}

cd ../ || {
  echo "Failed to change back to the parent directory"
  exit 1
}

cp esnet-smartnic-hw/examples/p4_only/Makefile ./

cp -r esnet-smartnic-hw/examples/p4_only/p4 ./

sed -i 's/\.\.\/\.\./$(CURDIR)\/esnet-smartnic-hw/g' Makefile 
sed -i 's/#export APP_NAME/export APP_NAME/g' Makefile
sed -i 's/#export P4_FILE/export P4_FILE/g' Makefile
sed -i 's/#export BUILD_NAME/export BUILD_NAME/g' Makefile

cp "../$P4_PROGRAM" "p4/$(basename "$PWD").p4"

if [ "$P4_PROGRAM" != "p4/p4_only.p4" ]; then
  rm -rf p4/p4_only.p4
fi
