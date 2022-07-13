#!/usr/bin/env bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )/

if [ ! -f $SCRIPT_DIR/bin/cobolcheck ]; then
    echo "Cobolcheck not found, try to fetch it."
    cd $SCRIPT_DIR/bin/
    ./fetch-cobolcheck
fi
cd $SCRIPT_DIR
./bin/cobolcheck -p hello-world