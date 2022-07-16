#!/bin/sh
if [ ! -f ../../../bin/cobolcheck ]; then
    echo "Cobolcheck not found, try to fetch it."
    DIR=$(pwd)
    cd ../../../bin/
    ./fetch-cobolcheck
    cd $DIR
fi
../../../bin/cobolcheck -c ../../../etc/config.properties -p hello-world