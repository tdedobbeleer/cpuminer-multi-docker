#!/bin/bash

CONFIG=/opt/cpuminer/config.json

if [ ! -f "$CONFIG" ]; then 
  echo
  echo ">>> No config file found, specify in ${CONFIG}"
  exit 1
fi 

echo
echo "****************************************************"
echo "Building cpuminer-multi"
echo "****************************************************"
echo "Compiling for current host processor..."

#Make it baby
cd /tmp/cpuminer-multi
./build.sh
cp cpuminer /usr/bin

#Cleanup
rm -rf /tmp/*
apt remove -y ${DEPENDENCIES}

echo
echo "****************************************************"
echo "Mining..."
echo "****************************************************"

exec /usr/bin/cpuminer --config=$CONFIG
